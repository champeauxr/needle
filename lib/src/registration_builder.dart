import 'package:needle/src/registration.dart';
import 'package:needle/src/registration_exception.dart';

/// Builder class used to create a class [Registration].
///
/// This class is created the registration methods of the [ContainerBuilder]
/// and implements a builder pattern for setting the attributes of a
/// class [Registration].
///
/// ```
///   builder
///      .registerType<RepositoryModelImpl>()
///      .as<RepositoryModel>()
///      .singleInstance()
///      .withParameters(
///          {'fooCache': const Named('Foo'), 'barCache': const Named('Bar')});
/// ```
class RegistrationBuilder {
  RegistrationBuilder(this.registration);

  Registration registration;

  /// Sets the base type of the registration.
  ///
  /// Used when registering a concrete class as an interface type.
  /// ```
  ///   builder
  ///      .registerType<RepositoryModelImpl>()
  ///      .as<RepositoryModel>();
  /// ```
  RegistrationBuilder as<T>() {
    registration = registration.copyWith(asType: T);
    return this;
  }

  /// Sets the [PersistenceType] of the registration as [PersistenceType.SingleInstance].
  RegistrationBuilder singleInstance() {
    registration =
        registration.copyWith(persistenceType: PersistenceType.SingleInstance);
    return this;
  }

  /// Sets the [PersistenceType] of the registration as [PersistenceType.InstancePerDependency].
  RegistrationBuilder instancePerDependency() {
    registration = registration.copyWith(
        persistenceType: PersistenceType.InstancePerDependency);
    return this;
  }

  /// Sets the [PersistenceType] of the registration as [PersistenceType.InstancePerScope].
  RegistrationBuilder instancePerScope() {
    registration = registration.copyWith(
        persistenceType: PersistenceType.InstancePerScope);
    return this;
  }

  /// Sets the [name] of the registration.
  ///
  /// This allows different configurations of a class to be registered under
  /// different names. It can also be used to create multiple named singletons.
  /// ```
  /// builder.registerType<ObjectCache>().singleInstance().withName('Foo');
  /// builder.registerType<ObjectCache>().singleInstance().withName('Bar');
  /// ```
  RegistrationBuilder withName(String name) {
    registration = registration.copyWith(name: name);
    return this;
  }

  /// Sets the name of the constructor to use for the registration.
  ///
  /// ```
  ///   builder
  ///      .registerType<FooDataStore>()
  ///      .withConstructor('large')
  ///      .singleInstance();
  /// ```
  RegistrationBuilder withConstructor(String constructor) {
    registration = registration.maybeMap(
      type: (typeReg) => typeReg.copyWith(constructor: constructor),
      orElse: () => throw RegistrationException('Not a type registration.'),
    );
    return this;
  }

  /// Provides a set of constructor parameters to be used when creating an object.
  ///
  /// This allows the registration to directly specify values for constructor
  /// [parameters] that will be used instead of resolving them from the
  /// [Scope].
  ///
  /// ```
  ///   builder
  ///      .registerType<BarDataStore>()
  ///      .singleInstance()
  ///      .withParameters({'size': 6});
  /// ```
  RegistrationBuilder withParameters(Map<String, dynamic> parameters) {
    registration = registration.maybeMap(
      type: (typeReg) => typeReg.copyWith(constructorParameters: parameters),
      orElse: () => throw RegistrationException('Not a type registration.'),
    );
    return this;
  }

  /// Sets a flag indicating that a new [Scope] will be created to contain
  /// the constructed object and any dependencies.
  RegistrationBuilder asScope() {
    registration = registration.copyWith(isScope: true);
    return this;
  }
}
