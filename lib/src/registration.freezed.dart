// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'registration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RegistrationTearOff {
  const _$RegistrationTearOff();

  _Instance instance(
      {String? name,
      Type? asType,
      PersistenceType? persistenceType,
      bool isScope = false,
      required Object instance}) {
    return _Instance(
      name: name,
      asType: asType,
      persistenceType: persistenceType,
      isScope: isScope,
      instance: instance,
    );
  }

  _Type type(
      {String? name,
      Type? asType,
      PersistenceType? persistenceType,
      Map<String, dynamic>? constructorParameters,
      bool isScope = false,
      required ClassMirror classMirror,
      String constructor = ''}) {
    return _Type(
      name: name,
      asType: asType,
      persistenceType: persistenceType,
      constructorParameters: constructorParameters,
      isScope: isScope,
      classMirror: classMirror,
      constructor: constructor,
    );
  }

  _Factory factory(
      {String? name,
      required Type? asType,
      PersistenceType? persistenceType,
      bool isScope = false,
      required Object Function(Scope) factory}) {
    return _Factory(
      name: name,
      asType: asType,
      persistenceType: persistenceType,
      isScope: isScope,
      factory: factory,
    );
  }
}

/// @nodoc
const $Registration = _$RegistrationTearOff();

/// @nodoc
mixin _$Registration {
  String? get name => throw _privateConstructorUsedError;
  Type? get asType => throw _privateConstructorUsedError;
  PersistenceType? get persistenceType => throw _privateConstructorUsedError;
  bool get isScope => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? name, Type? asType,
            PersistenceType? persistenceType, bool isScope, Object instance)
        instance,
    required TResult Function(
            String? name,
            Type? asType,
            PersistenceType? persistenceType,
            Map<String, dynamic>? constructorParameters,
            bool isScope,
            ClassMirror classMirror,
            String constructor)
        type,
    required TResult Function(
            String? name,
            Type? asType,
            PersistenceType? persistenceType,
            bool isScope,
            Object Function(Scope) factory)
        factory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? name, Type? asType,
            PersistenceType? persistenceType, bool isScope, Object instance)?
        instance,
    TResult Function(
            String? name,
            Type? asType,
            PersistenceType? persistenceType,
            Map<String, dynamic>? constructorParameters,
            bool isScope,
            ClassMirror classMirror,
            String constructor)?
        type,
    TResult Function(
            String? name,
            Type? asType,
            PersistenceType? persistenceType,
            bool isScope,
            Object Function(Scope) factory)?
        factory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Instance value) instance,
    required TResult Function(_Type value) type,
    required TResult Function(_Factory value) factory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Instance value)? instance,
    TResult Function(_Type value)? type,
    TResult Function(_Factory value)? factory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegistrationCopyWith<Registration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationCopyWith<$Res> {
  factory $RegistrationCopyWith(
          Registration value, $Res Function(Registration) then) =
      _$RegistrationCopyWithImpl<$Res>;
  $Res call(
      {String? name,
      Type? asType,
      PersistenceType? persistenceType,
      bool isScope});
}

/// @nodoc
class _$RegistrationCopyWithImpl<$Res> implements $RegistrationCopyWith<$Res> {
  _$RegistrationCopyWithImpl(this._value, this._then);

  final Registration _value;
  // ignore: unused_field
  final $Res Function(Registration) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? asType = freezed,
    Object? persistenceType = freezed,
    Object? isScope = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      asType: asType == freezed
          ? _value.asType
          : asType // ignore: cast_nullable_to_non_nullable
              as Type?,
      persistenceType: persistenceType == freezed
          ? _value.persistenceType
          : persistenceType // ignore: cast_nullable_to_non_nullable
              as PersistenceType?,
      isScope: isScope == freezed
          ? _value.isScope
          : isScope // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$InstanceCopyWith<$Res> implements $RegistrationCopyWith<$Res> {
  factory _$InstanceCopyWith(_Instance value, $Res Function(_Instance) then) =
      __$InstanceCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? name,
      Type? asType,
      PersistenceType? persistenceType,
      bool isScope,
      Object instance});
}

/// @nodoc
class __$InstanceCopyWithImpl<$Res> extends _$RegistrationCopyWithImpl<$Res>
    implements _$InstanceCopyWith<$Res> {
  __$InstanceCopyWithImpl(_Instance _value, $Res Function(_Instance) _then)
      : super(_value, (v) => _then(v as _Instance));

  @override
  _Instance get _value => super._value as _Instance;

  @override
  $Res call({
    Object? name = freezed,
    Object? asType = freezed,
    Object? persistenceType = freezed,
    Object? isScope = freezed,
    Object? instance = freezed,
  }) {
    return _then(_Instance(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      asType: asType == freezed
          ? _value.asType
          : asType // ignore: cast_nullable_to_non_nullable
              as Type?,
      persistenceType: persistenceType == freezed
          ? _value.persistenceType
          : persistenceType // ignore: cast_nullable_to_non_nullable
              as PersistenceType?,
      isScope: isScope == freezed
          ? _value.isScope
          : isScope // ignore: cast_nullable_to_non_nullable
              as bool,
      instance: instance == freezed
          ? _value.instance
          : instance // ignore: cast_nullable_to_non_nullable
              as Object,
    ));
  }
}

/// @nodoc

class _$_Instance implements _Instance {
  const _$_Instance(
      {this.name,
      this.asType,
      this.persistenceType,
      this.isScope = false,
      required this.instance});

  @override
  final String? name;
  @override
  final Type? asType;
  @override
  final PersistenceType? persistenceType;
  @JsonKey(defaultValue: false)
  @override
  final bool isScope;
  @override
  final Object instance;

  @override
  String toString() {
    return 'Registration.instance(name: $name, asType: $asType, persistenceType: $persistenceType, isScope: $isScope, instance: $instance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Instance &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.asType, asType) ||
                const DeepCollectionEquality().equals(other.asType, asType)) &&
            (identical(other.persistenceType, persistenceType) ||
                const DeepCollectionEquality()
                    .equals(other.persistenceType, persistenceType)) &&
            (identical(other.isScope, isScope) ||
                const DeepCollectionEquality()
                    .equals(other.isScope, isScope)) &&
            (identical(other.instance, instance) ||
                const DeepCollectionEquality()
                    .equals(other.instance, instance)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(asType) ^
      const DeepCollectionEquality().hash(persistenceType) ^
      const DeepCollectionEquality().hash(isScope) ^
      const DeepCollectionEquality().hash(instance);

  @JsonKey(ignore: true)
  @override
  _$InstanceCopyWith<_Instance> get copyWith =>
      __$InstanceCopyWithImpl<_Instance>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? name, Type? asType,
            PersistenceType? persistenceType, bool isScope, Object instance)
        instance,
    required TResult Function(
            String? name,
            Type? asType,
            PersistenceType? persistenceType,
            Map<String, dynamic>? constructorParameters,
            bool isScope,
            ClassMirror classMirror,
            String constructor)
        type,
    required TResult Function(
            String? name,
            Type? asType,
            PersistenceType? persistenceType,
            bool isScope,
            Object Function(Scope) factory)
        factory,
  }) {
    return instance(name, asType, persistenceType, isScope, this.instance);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? name, Type? asType,
            PersistenceType? persistenceType, bool isScope, Object instance)?
        instance,
    TResult Function(
            String? name,
            Type? asType,
            PersistenceType? persistenceType,
            Map<String, dynamic>? constructorParameters,
            bool isScope,
            ClassMirror classMirror,
            String constructor)?
        type,
    TResult Function(
            String? name,
            Type? asType,
            PersistenceType? persistenceType,
            bool isScope,
            Object Function(Scope) factory)?
        factory,
    required TResult orElse(),
  }) {
    if (instance != null) {
      return instance(name, asType, persistenceType, isScope, this.instance);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Instance value) instance,
    required TResult Function(_Type value) type,
    required TResult Function(_Factory value) factory,
  }) {
    return instance(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Instance value)? instance,
    TResult Function(_Type value)? type,
    TResult Function(_Factory value)? factory,
    required TResult orElse(),
  }) {
    if (instance != null) {
      return instance(this);
    }
    return orElse();
  }
}

abstract class _Instance implements Registration {
  const factory _Instance(
      {String? name,
      Type? asType,
      PersistenceType? persistenceType,
      bool isScope,
      required Object instance}) = _$_Instance;

  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  Type? get asType => throw _privateConstructorUsedError;
  @override
  PersistenceType? get persistenceType => throw _privateConstructorUsedError;
  @override
  bool get isScope => throw _privateConstructorUsedError;
  Object get instance => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$InstanceCopyWith<_Instance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$TypeCopyWith<$Res> implements $RegistrationCopyWith<$Res> {
  factory _$TypeCopyWith(_Type value, $Res Function(_Type) then) =
      __$TypeCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? name,
      Type? asType,
      PersistenceType? persistenceType,
      Map<String, dynamic>? constructorParameters,
      bool isScope,
      ClassMirror classMirror,
      String constructor});
}

/// @nodoc
class __$TypeCopyWithImpl<$Res> extends _$RegistrationCopyWithImpl<$Res>
    implements _$TypeCopyWith<$Res> {
  __$TypeCopyWithImpl(_Type _value, $Res Function(_Type) _then)
      : super(_value, (v) => _then(v as _Type));

  @override
  _Type get _value => super._value as _Type;

  @override
  $Res call({
    Object? name = freezed,
    Object? asType = freezed,
    Object? persistenceType = freezed,
    Object? constructorParameters = freezed,
    Object? isScope = freezed,
    Object? classMirror = freezed,
    Object? constructor = freezed,
  }) {
    return _then(_Type(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      asType: asType == freezed
          ? _value.asType
          : asType // ignore: cast_nullable_to_non_nullable
              as Type?,
      persistenceType: persistenceType == freezed
          ? _value.persistenceType
          : persistenceType // ignore: cast_nullable_to_non_nullable
              as PersistenceType?,
      constructorParameters: constructorParameters == freezed
          ? _value.constructorParameters
          : constructorParameters // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      isScope: isScope == freezed
          ? _value.isScope
          : isScope // ignore: cast_nullable_to_non_nullable
              as bool,
      classMirror: classMirror == freezed
          ? _value.classMirror
          : classMirror // ignore: cast_nullable_to_non_nullable
              as ClassMirror,
      constructor: constructor == freezed
          ? _value.constructor
          : constructor // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Type implements _Type {
  const _$_Type(
      {this.name,
      this.asType,
      this.persistenceType,
      this.constructorParameters,
      this.isScope = false,
      required this.classMirror,
      this.constructor = ''});

  @override
  final String? name;
  @override
  final Type? asType;
  @override
  final PersistenceType? persistenceType;
  @override
  final Map<String, dynamic>? constructorParameters;
  @JsonKey(defaultValue: false)
  @override
  final bool isScope;
  @override
  final ClassMirror classMirror;
  @JsonKey(defaultValue: '')
  @override
  final String constructor;

  @override
  String toString() {
    return 'Registration.type(name: $name, asType: $asType, persistenceType: $persistenceType, constructorParameters: $constructorParameters, isScope: $isScope, classMirror: $classMirror, constructor: $constructor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Type &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.asType, asType) ||
                const DeepCollectionEquality().equals(other.asType, asType)) &&
            (identical(other.persistenceType, persistenceType) ||
                const DeepCollectionEquality()
                    .equals(other.persistenceType, persistenceType)) &&
            (identical(other.constructorParameters, constructorParameters) ||
                const DeepCollectionEquality().equals(
                    other.constructorParameters, constructorParameters)) &&
            (identical(other.isScope, isScope) ||
                const DeepCollectionEquality()
                    .equals(other.isScope, isScope)) &&
            (identical(other.classMirror, classMirror) ||
                const DeepCollectionEquality()
                    .equals(other.classMirror, classMirror)) &&
            (identical(other.constructor, constructor) ||
                const DeepCollectionEquality()
                    .equals(other.constructor, constructor)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(asType) ^
      const DeepCollectionEquality().hash(persistenceType) ^
      const DeepCollectionEquality().hash(constructorParameters) ^
      const DeepCollectionEquality().hash(isScope) ^
      const DeepCollectionEquality().hash(classMirror) ^
      const DeepCollectionEquality().hash(constructor);

  @JsonKey(ignore: true)
  @override
  _$TypeCopyWith<_Type> get copyWith =>
      __$TypeCopyWithImpl<_Type>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? name, Type? asType,
            PersistenceType? persistenceType, bool isScope, Object instance)
        instance,
    required TResult Function(
            String? name,
            Type? asType,
            PersistenceType? persistenceType,
            Map<String, dynamic>? constructorParameters,
            bool isScope,
            ClassMirror classMirror,
            String constructor)
        type,
    required TResult Function(
            String? name,
            Type? asType,
            PersistenceType? persistenceType,
            bool isScope,
            Object Function(Scope) factory)
        factory,
  }) {
    return type(name, asType, persistenceType, constructorParameters, isScope,
        classMirror, constructor);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? name, Type? asType,
            PersistenceType? persistenceType, bool isScope, Object instance)?
        instance,
    TResult Function(
            String? name,
            Type? asType,
            PersistenceType? persistenceType,
            Map<String, dynamic>? constructorParameters,
            bool isScope,
            ClassMirror classMirror,
            String constructor)?
        type,
    TResult Function(
            String? name,
            Type? asType,
            PersistenceType? persistenceType,
            bool isScope,
            Object Function(Scope) factory)?
        factory,
    required TResult orElse(),
  }) {
    if (type != null) {
      return type(name, asType, persistenceType, constructorParameters, isScope,
          classMirror, constructor);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Instance value) instance,
    required TResult Function(_Type value) type,
    required TResult Function(_Factory value) factory,
  }) {
    return type(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Instance value)? instance,
    TResult Function(_Type value)? type,
    TResult Function(_Factory value)? factory,
    required TResult orElse(),
  }) {
    if (type != null) {
      return type(this);
    }
    return orElse();
  }
}

abstract class _Type implements Registration {
  const factory _Type(
      {String? name,
      Type? asType,
      PersistenceType? persistenceType,
      Map<String, dynamic>? constructorParameters,
      bool isScope,
      required ClassMirror classMirror,
      String constructor}) = _$_Type;

  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  Type? get asType => throw _privateConstructorUsedError;
  @override
  PersistenceType? get persistenceType => throw _privateConstructorUsedError;
  Map<String, dynamic>? get constructorParameters =>
      throw _privateConstructorUsedError;
  @override
  bool get isScope => throw _privateConstructorUsedError;
  ClassMirror get classMirror => throw _privateConstructorUsedError;
  String get constructor => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TypeCopyWith<_Type> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$FactoryCopyWith<$Res> implements $RegistrationCopyWith<$Res> {
  factory _$FactoryCopyWith(_Factory value, $Res Function(_Factory) then) =
      __$FactoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? name,
      Type? asType,
      PersistenceType? persistenceType,
      bool isScope,
      Object Function(Scope) factory});
}

/// @nodoc
class __$FactoryCopyWithImpl<$Res> extends _$RegistrationCopyWithImpl<$Res>
    implements _$FactoryCopyWith<$Res> {
  __$FactoryCopyWithImpl(_Factory _value, $Res Function(_Factory) _then)
      : super(_value, (v) => _then(v as _Factory));

  @override
  _Factory get _value => super._value as _Factory;

  @override
  $Res call({
    Object? name = freezed,
    Object? asType = freezed,
    Object? persistenceType = freezed,
    Object? isScope = freezed,
    Object? factory = freezed,
  }) {
    return _then(_Factory(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      asType: asType == freezed
          ? _value.asType
          : asType // ignore: cast_nullable_to_non_nullable
              as Type?,
      persistenceType: persistenceType == freezed
          ? _value.persistenceType
          : persistenceType // ignore: cast_nullable_to_non_nullable
              as PersistenceType?,
      isScope: isScope == freezed
          ? _value.isScope
          : isScope // ignore: cast_nullable_to_non_nullable
              as bool,
      factory: factory == freezed
          ? _value.factory
          : factory // ignore: cast_nullable_to_non_nullable
              as Object Function(Scope),
    ));
  }
}

/// @nodoc

class _$_Factory implements _Factory {
  const _$_Factory(
      {this.name,
      required this.asType,
      this.persistenceType,
      this.isScope = false,
      required this.factory});

  @override
  final String? name;
  @override
  final Type? asType;
  @override
  final PersistenceType? persistenceType;
  @JsonKey(defaultValue: false)
  @override
  final bool isScope;
  @override
  final Object Function(Scope) factory;

  @override
  String toString() {
    return 'Registration.factory(name: $name, asType: $asType, persistenceType: $persistenceType, isScope: $isScope, factory: $factory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Factory &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.asType, asType) ||
                const DeepCollectionEquality().equals(other.asType, asType)) &&
            (identical(other.persistenceType, persistenceType) ||
                const DeepCollectionEquality()
                    .equals(other.persistenceType, persistenceType)) &&
            (identical(other.isScope, isScope) ||
                const DeepCollectionEquality()
                    .equals(other.isScope, isScope)) &&
            (identical(other.factory, factory) ||
                const DeepCollectionEquality().equals(other.factory, factory)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(asType) ^
      const DeepCollectionEquality().hash(persistenceType) ^
      const DeepCollectionEquality().hash(isScope) ^
      const DeepCollectionEquality().hash(factory);

  @JsonKey(ignore: true)
  @override
  _$FactoryCopyWith<_Factory> get copyWith =>
      __$FactoryCopyWithImpl<_Factory>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? name, Type? asType,
            PersistenceType? persistenceType, bool isScope, Object instance)
        instance,
    required TResult Function(
            String? name,
            Type? asType,
            PersistenceType? persistenceType,
            Map<String, dynamic>? constructorParameters,
            bool isScope,
            ClassMirror classMirror,
            String constructor)
        type,
    required TResult Function(
            String? name,
            Type? asType,
            PersistenceType? persistenceType,
            bool isScope,
            Object Function(Scope) factory)
        factory,
  }) {
    return factory(name, asType, persistenceType, isScope, this.factory);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? name, Type? asType,
            PersistenceType? persistenceType, bool isScope, Object instance)?
        instance,
    TResult Function(
            String? name,
            Type? asType,
            PersistenceType? persistenceType,
            Map<String, dynamic>? constructorParameters,
            bool isScope,
            ClassMirror classMirror,
            String constructor)?
        type,
    TResult Function(
            String? name,
            Type? asType,
            PersistenceType? persistenceType,
            bool isScope,
            Object Function(Scope) factory)?
        factory,
    required TResult orElse(),
  }) {
    if (factory != null) {
      return factory(name, asType, persistenceType, isScope, this.factory);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Instance value) instance,
    required TResult Function(_Type value) type,
    required TResult Function(_Factory value) factory,
  }) {
    return factory(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Instance value)? instance,
    TResult Function(_Type value)? type,
    TResult Function(_Factory value)? factory,
    required TResult orElse(),
  }) {
    if (factory != null) {
      return factory(this);
    }
    return orElse();
  }
}

abstract class _Factory implements Registration {
  const factory _Factory(
      {String? name,
      required Type? asType,
      PersistenceType? persistenceType,
      bool isScope,
      required Object Function(Scope) factory}) = _$_Factory;

  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  Type? get asType => throw _privateConstructorUsedError;
  @override
  PersistenceType? get persistenceType => throw _privateConstructorUsedError;
  @override
  bool get isScope => throw _privateConstructorUsedError;
  Object Function(Scope) get factory => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FactoryCopyWith<_Factory> get copyWith =>
      throw _privateConstructorUsedError;
}
