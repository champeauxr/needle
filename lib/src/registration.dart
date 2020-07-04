import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:needle/needle.dart';
import 'package:needle/src/mirrors.dart';

part 'registration.freezed.dart';

/// Persistence types for class registrations.
enum PersistenceType {
  /// A single instance of the class will be created.
  SingleInstance,

  /// A new instance of the class will be created each time the class is resolved.
  InstancePerDependency,

  /// A single instance of the class will be created for each [Scope].
  InstancePerScope
}

/// A class registration that specifies how a class will be created by Needle.
@freezed
abstract class Registration with _$Registration {
  /// Creates a registration for an existing [instance] of a class.
  ///
  /// The registration can optionally specify the following attributes of
  /// the registration:
  /// * The [name] of the registration.
  /// * An interface or base type ([asType]) to use as the type of the registration.
  /// * The [persistenceType] of the registration that specifies if values for the registration are cached.
  /// * A value ([isScope]) indicating whether the object created by the registration is a new lifetime scope.
  const factory Registration.instance({
    String name,
    Type asType,
    PersistenceType persistenceType,
    bool isScope,
    @required dynamic instance,
  }) = _Instance;

  /// Creates a registration for the class type represented by [classMirror].
  ///
  /// The registration can optionally specify the following attributes of
  /// the registration:
  /// * The [name] of the registration.
  /// * An interface or base type ([asType]) to use as the type of the registration.
  /// * The [persistenceType] of the registration that specifies if values for the registration are cached.
  /// * A collection of [constructorParameters] to use when creating an instance of the class.
  /// * A collection of [expectedParameters] that will be provided when resolving an instance of the class.
  /// * The name of the [constructor] to use when creating an instance of the class.
  /// * A value ([isScope]) indicating whether the object created by the registration is a new lifetime scope.
  const factory Registration.type({
    String name,
    Type asType,
    PersistenceType persistenceType,
    Map<String, dynamic> constructorParameters,
    bool isScope,
    @required ClassMirror classMirror,
    @Default('') String constructor,
  }) = _Type;

  /// Creates a registration that calls a [factory] method to create an object
  /// of type [asType].
  ///
  /// The registration can optionally specify the following attributes of
  /// the registration:
  /// * The [name] of the registration.
  /// * The [persistenceType] of the registration that specifies if values for the registration are cached.
  /// * A value ([isScope]) indicating whether the object created by the registration is a new lifetime scope.
  const factory Registration.factory({
    String name,
    @required Type asType,
    PersistenceType persistenceType,
    bool isScope,
    dynamic Function(Scope container) factory,
  }) = _Factory;
}
