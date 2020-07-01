import 'package:needle/class_factory.dart';

import 'needle.dart';

enum _RegistrationType {
  SingleInstance,
  InstancePerDependency,
  InstancePerScope
}

const String Resolve = '9eeed114-035f-452d-bb8f-0dd198336394';

class _Registration {
  _Registration.instance(this.instanceMirror)
      : asType = instanceMirror.runtimeType,
        registrationType = _RegistrationType.SingleInstance;

  _Registration.type(this.type) : asType = type;

  _Registration.factory(this.type, this.factory) : asType = type;

  _RegistrationType registrationType;

  String name;
  Type asType;
  Type type;
  dynamic instanceMirror;
  InstanceBuilder factory;
  String constructor;
  Map<String, dynamic> parameters;
  bool isScope;
}

class RegistrationBuilder {
  RegistrationBuilder(this._registration);

  final _Registration _registration;

  RegistrationBuilder as<T>() {
    _registration.asType = T;
    return this;
  }

  RegistrationBuilder singleInstance() {
    _registration.registrationType = _RegistrationType.SingleInstance;
    return this;
  }

  RegistrationBuilder instancePerDependency() {
    _registration.registrationType = _RegistrationType.InstancePerDependency;
    return this;
  }

  RegistrationBuilder instancePerScope() {
    _registration.registrationType = _RegistrationType.InstancePerScope;
    return this;
  }

  RegistrationBuilder withName(String name) {
    _registration.name = name;
    return this;
  }

  RegistrationBuilder withConstructor(String constructor) {
    _registration.constructor = constructor;
    return this;
  }

  RegistrationBuilder withParameters(Map<String, dynamic> parameters) {
    _registration.parameters = parameters;
    return this;
  }

  RegistrationBuilder asScope() {
    _registration.isScope = true;
    return this;
  }
}

class RegistrationException {
  RegistrationException(this.message);

  String message;
}

abstract class _ComponentCache {
  final _cache = <_Registration, dynamic>{};
}

abstract class Scope with _ComponentCache {
  T resolve<T>({String name});

  Scope createScope();
}

class _ComponentScope extends Scope {
  _ComponentScope(this._container);

  final ComponentContainer _container;

  @override
  T resolve<T>({String name}) {
    return _container.resolve<T>(this, name: name);
  }

  @override
  Scope createScope() {
    return _ComponentScope(_container);
  }
}

class ComponentContainer with _ComponentCache {
  ComponentContainer(this._factory, this._registrations);

  final ClassFactory _factory;
  final List<_Registration> _registrations;

  Scope createScope() {
    return _ComponentScope(this);
  }

  dynamic construct(Scope scope, _Registration registration) {
    // check if it's a registered instance.
    if (registration.instanceMirror != null) {
      return registration.instanceMirror.reflectee;
    }

    if (registration.factory != null) {
      return registration.factory(this);
    }

    final constructorMirror = _factory.getConstructor(
        registration.type, registration.constructor ?? '');

    final positionalArguments = <dynamic>[];
    final namedArguments = <Symbol, dynamic>{};
    for (var parameter in constructorMirror.parameters) {
      dynamic parameterValue;

      final parameterOverride = registration.parameters != null
          ? registration.parameters[parameter.name]
          : null;

      if (parameterOverride != null && !(parameterOverride is Named)) {
        parameterValue = parameterOverride;
      } else {
        final type = parameter.type;
        final Named nameAttribute = parameterOverride is Named
            ? parameterOverride
            : parameter.metadata
                .firstWhere((m) => m is Named, orElse: () => null);

        print(
            '\tparameter: ${parameter.name} $type ${parameter.isNamed} ${parameter.isOptional}');

        parameterValue = _resolve(scope, type, nameAttribute?.name);
      }

      if (parameter.isNamed) {
        namedArguments[Symbol(parameter.name)] = parameterValue;
      } else {
        positionalArguments.add(parameterValue);
      }
    }

    return constructorMirror.newInstance(positionalArguments, namedArguments);
  }

  // TODO(rc): implement asScope() functionality
  dynamic _resolve(Scope scope, Type type, String name) {
    print('Constructing $type');

    final registration = _registrations.firstWhere(
        (r) => r.asType == type && r.name == name,
        orElse: () => null);

    if (registration == null) {
      print('Registration for $type not found');
      throw RegistrationException('Registration not found for $type');
    }

    dynamic result;
    switch (registration.registrationType) {
      case _RegistrationType.SingleInstance:
        result = _cache[registration];
        break;
      case _RegistrationType.InstancePerScope:
        result = scope._cache[registration];
        break;
      case _RegistrationType.InstancePerDependency:
        break;
    }

    final foundInCache = result != null;
    if (!foundInCache) {
      result = construct(scope, registration);

      switch (registration.registrationType) {
        case _RegistrationType.SingleInstance:
          _cache[registration] = result;
          break;
        case _RegistrationType.InstancePerScope:
          scope._cache[registration] = result;
          break;
        case _RegistrationType.InstancePerDependency:
          break;
      }
    }

    return result;
  }

  T resolve<T>(Scope scope, {String name}) {
    return _resolve(scope, T, name);
  }
}

typedef InstanceBuilder = dynamic Function(ComponentContainer container);

class ContainerBuilder {
  ContainerBuilder(this._classFactory);

  final ClassFactory _classFactory;

  final List<RegistrationBuilder> _builders = <RegistrationBuilder>[];

  RegistrationBuilder registerType<T>() {
    final builder = RegistrationBuilder(_Registration.type(T));
    _builders.add(builder);
    return builder;
  }

  RegistrationBuilder registerInstance(dynamic instance) {
    final builder = RegistrationBuilder(_Registration.instance(instance));
    _builders.add(builder);
    return builder;
  }

  RegistrationBuilder registerFactory<T>(InstanceBuilder factory) {
    final builder = RegistrationBuilder(_Registration.factory(T, factory));
    _builders.add(builder);
    return builder;
  }

  Scope build() {
    return ComponentContainer(
            _classFactory, _builders.map((b) => b._registration).toList())
        .createScope();
  }
}
