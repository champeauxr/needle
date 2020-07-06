import 'package:needle/src/annotations.dart';
import 'package:needle/src/mirrors.dart';
import 'package:needle/src/registration.dart';
import 'package:needle/src/registration_builder.dart';
import 'package:needle/src/registration_exception.dart';

/// An IoC container used to resolve objects.
///
/// The [Scope] serves two purposes: it provides a mechanism for creating
/// instances of registered classes, and it caches [PersistenceType.SingleInstance]
/// and [PersistenceType.InstancePerScope] class instances. When a client
/// calls the [resolve()] method, the [Scope] will search the registrations,
/// examine the [PersistenceType], and determine whether the object can be
/// retrieved from the cache or if a new instance must be constructed.
///
/// When a new instance of the request class must be constructed, Needle
/// examines the constructor parameters and recursively resolves an object
/// for each parameter.
///
/// ```
/// final dataStore = scope.resolve<FooDataStore>();
/// ```
///
/// To create a [Scope] instance, clients add registrations to a [ScopeBuilder]
/// and call its [build()] method. ScopeBuilders are created using code
/// generation and are filled with reflection mirrors for requested types.
///
/// ```
/// @needle
/// class InjectionBuilder extends $Builder {}
///
/// final builder = InjectionBuilder();
/// builder.registerType<FooDataStore>().singleInstance();
/// final scope = builder.build();
/// ```
abstract class Scope with _ComponentCache {
  /// Resolves a instance of class [T]. If [name] is provided, a named
  /// registration is used.
  T resolve<T>({String name});

  /// Creates a new child [Scope]. Object created from registrations with
  /// [PersistenceType.InstancePerScope] are cached in the scope that created them.
  Scope createScope();

  /// Retrieves the root Scope.
  static Scope get root => _rootScope;

  static Scope _rootScope;
}

/// A dependency injection builder that creates the root [Scope] object
/// from type registrations.
///
/// The [ScopeBuilder] is an abstract class that contains the base logic
/// for creating Needle [Scope] objects. Derived classes must provide an
/// implementation of the [getMirror()] method that describes the construction
/// information for classes.
///
/// This derived class is typically provided using the Needle code generator.
/// When a class is annotated with the [@needle] annotation, a [ScopeBuilder]
/// derived class is created containing a collection of [ClassMirror] objects
/// for each of classes marked with the [@reflect] or the [@ReflectInclude]
/// annotations.
///
/// ```
/// @needle
/// class Builder extends $Builder {}
/// ```
abstract class ScopeBuilder {
  ScopeBuilder();

  final List<RegistrationBuilder> _builders = <RegistrationBuilder>[];
  void Function(String message) _logger;

  /// Provides a [ClassMirror] for the specified [type].
  ///
  /// This method must be provided by a derived class.
  ClassMirror getMirror(Type type) {
    throw RegistrationException('getMirror() not implemented');
  }

  /// Installs a logger for resolution messages.
  void setLogger(void Function(String message) logger) {
    _logger = logger;
  }

  /// Adds a registration for the type [T].
  RegistrationBuilder registerType<T>() {
    final builder = RegistrationBuilder(Registration.type(
      classMirror: getMirror(T),
      asType: T,
    ));
    _builders.add(builder);
    return builder;
  }

  /// Adds a registration that provides a specific [instance] of a class.
  RegistrationBuilder registerInstance(dynamic instance) {
    final builder = RegistrationBuilder(Registration.instance(
      instance: instance,
      asType: instance.runtimeType,
    ));
    _builders.add(builder);
    return builder;
  }

  /// Adds a registration with a [factory] method.
  RegistrationBuilder registerFactory<T>(
      dynamic Function(Scope container) factory) {
    final builder = RegistrationBuilder(Registration.factory(
      factory: factory,
      asType: T,
    ));
    _builders.add(builder);
    return builder;
  }

  /// Builds the root [Scope] from the registrations.
  Scope build({bool setAsRoot = true}) {
    if (setAsRoot && Scope._rootScope != null) {
      throw RegistrationException('Root scope has already been set');
    }

    final scope = _ComponentContainer(
            _builders.map((b) => b.registration).toList(), _logger)
        .createScope();

    if (setAsRoot) {
      Scope._rootScope = scope;
    }

    return scope;
  }
}

/// A cache for singleInstance and instancePerScope object created by the Scope.
abstract class _ComponentCache {
  final _cache = <Registration, dynamic>{};
}

/// Concrete implementation of the Scope class that delegates object resolution
/// to the _ComponentContainer.
class _ComponentScope extends Scope {
  _ComponentScope(this._container);

  final _ComponentContainer _container;

  @override
  T resolve<T>({String name}) {
    return _container.resolve<T>(this, name: name);
  }

  @override
  Scope createScope() {
    return _ComponentScope(_container);
  }
}

/// [_ComponentContainer] creates instances of classes from the class registrations.
class _ComponentContainer with _ComponentCache {
  _ComponentContainer(this._registrations, this._logger);

  /// The list of type registrations.
  final List<Registration> _registrations;
  final void Function(String message) _logger;

  /// Provides a [ClassMirror] for the specified [type].
  ///
  /// This method must be provided by a derived class.
  Scope createScope() {
    return _ComponentScope(this);
  }

  /// Constructs an object using the specified [registration].
  dynamic construct(Scope scope, Registration registration) {
    return registration.map(
        instance: (reg) => reg.instance,
        factory: (reg) => reg.factory(scope),
        type: (reg) {
          final constructorMirror =
              reg.classMirror.constructors[reg.constructor];

          final positionalArguments = <dynamic>[];
          final namedArguments = <Symbol, dynamic>{};
          for (var parameter in constructorMirror.parameters) {
            dynamic parameterValue;

            final parameterOverride = reg.constructorParameters != null
                ? reg.constructorParameters[parameter.name]
                : null;

            if (parameterOverride != null && !(parameterOverride is Named)) {
              parameterValue = parameterOverride;
            } else {
              final type = parameter.type;
              final Named nameAttribute = parameterOverride is Named
                  ? parameterOverride
                  : parameter.metadata
                      .firstWhere((m) => m is Named, orElse: () => null);

              parameterValue = _resolve(scope, type, nameAttribute?.name);
            }

            if (parameter.isNamed) {
              namedArguments[Symbol(parameter.name)] = parameterValue;
            } else {
              positionalArguments.add(parameterValue);
            }
          }

          return constructorMirror.newInstance(
              positionalArguments, namedArguments);
        });
  }

  /// Resolves an instance of [type]. If [name] is provided, a named registration
  /// will be used. If the registration is an [PersistenceType.InstancePerScope],
  /// the [scope]'s cache will be searched for the object before searching
  /// parent scopes.
  dynamic _resolve(Scope scope, Type type, String name) {
    // TODO(rc): implement asScope() functionality

    if (type == Scope) {
      assert(name == null || name == '');

      return scope;
    }

    final registration = _registrations.firstWhere(
        (r) => r.asType == type && r.name == name,
        orElse: () => null);

    if (registration == null) {
      _logger?.call('Registration for $type not found');
      throw RegistrationException('Registration not found for $type');
    }

    dynamic result;
    switch (registration.persistenceType) {
      case PersistenceType.SingleInstance:
        result = _cache[registration];
        break;
      case PersistenceType.InstancePerScope:
        result = scope._cache[registration];
        break;
      case PersistenceType.InstancePerDependency:
        break;
    }

    final foundInCache = result != null;
    if (!foundInCache) {
      result = construct(scope, registration);
      _logger?.call('Created $type with name \'${registration.name ?? ''}\'');

      switch (registration.persistenceType) {
        case PersistenceType.SingleInstance:
          _cache[registration] = result;
          break;
        case PersistenceType.InstancePerScope:
          scope._cache[registration] = result;
          break;
        case PersistenceType.InstancePerDependency:
          break;
      }
    } else {
      _logger?.call(
          'Resolved $type with name \'${registration.name ?? ''}\' from cache');
    }

    return result;
  }

  /// Resolves an instance of [T]. If [name] is provided, a named registration
  /// will be used. If the registration is an [PersistenceType.InstancePerScope],
  /// the [scope]'s cache will be searched for the object before searching
  /// parent scopes.
  T resolve<T>(Scope scope, {String name}) {
    return _resolve(scope, T, name);
  }
}
