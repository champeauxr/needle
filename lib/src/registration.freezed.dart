// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'registration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$RegistrationTearOff {
  const _$RegistrationTearOff();

  _Instance instance(
      {String name,
      Type asType,
      PersistenceType persistenceType,
      bool isScope,
      @required dynamic instance}) {
    return _Instance(
      name: name,
      asType: asType,
      persistenceType: persistenceType,
      isScope: isScope,
      instance: instance,
    );
  }

  _Type type(
      {String name,
      Type asType,
      PersistenceType persistenceType,
      Map<String, dynamic> constructorParameters,
      bool isScope,
      @required ClassMirror classMirror,
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
      {String name,
      @required Type asType,
      PersistenceType persistenceType,
      bool isScope,
      dynamic Function(Scope) factory}) {
    return _Factory(
      name: name,
      asType: asType,
      persistenceType: persistenceType,
      isScope: isScope,
      factory: factory,
    );
  }
}

// ignore: unused_element
const $Registration = _$RegistrationTearOff();

mixin _$Registration {
  String get name;
  Type get asType;
  PersistenceType get persistenceType;
  bool get isScope;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result instance(String name, Type asType,
            PersistenceType persistenceType, bool isScope, dynamic instance),
    @required
        Result type(
            String name,
            Type asType,
            PersistenceType persistenceType,
            Map<String, dynamic> constructorParameters,
            bool isScope,
            ClassMirror classMirror,
            String constructor),
    @required
        Result factory(
            String name,
            Type asType,
            PersistenceType persistenceType,
            bool isScope,
            dynamic Function(Scope) factory),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result instance(String name, Type asType, PersistenceType persistenceType,
        bool isScope, dynamic instance),
    Result type(
        String name,
        Type asType,
        PersistenceType persistenceType,
        Map<String, dynamic> constructorParameters,
        bool isScope,
        ClassMirror classMirror,
        String constructor),
    Result factory(String name, Type asType, PersistenceType persistenceType,
        bool isScope, dynamic Function(Scope) factory),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result instance(_Instance value),
    @required Result type(_Type value),
    @required Result factory(_Factory value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result instance(_Instance value),
    Result type(_Type value),
    Result factory(_Factory value),
    @required Result orElse(),
  });

  $RegistrationCopyWith<Registration> get copyWith;
}

abstract class $RegistrationCopyWith<$Res> {
  factory $RegistrationCopyWith(
          Registration value, $Res Function(Registration) then) =
      _$RegistrationCopyWithImpl<$Res>;
  $Res call(
      {String name,
      Type asType,
      PersistenceType persistenceType,
      bool isScope});
}

class _$RegistrationCopyWithImpl<$Res> implements $RegistrationCopyWith<$Res> {
  _$RegistrationCopyWithImpl(this._value, this._then);

  final Registration _value;
  // ignore: unused_field
  final $Res Function(Registration) _then;

  @override
  $Res call({
    Object name = freezed,
    Object asType = freezed,
    Object persistenceType = freezed,
    Object isScope = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      asType: asType == freezed ? _value.asType : asType as Type,
      persistenceType: persistenceType == freezed
          ? _value.persistenceType
          : persistenceType as PersistenceType,
      isScope: isScope == freezed ? _value.isScope : isScope as bool,
    ));
  }
}

abstract class _$InstanceCopyWith<$Res> implements $RegistrationCopyWith<$Res> {
  factory _$InstanceCopyWith(_Instance value, $Res Function(_Instance) then) =
      __$InstanceCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      Type asType,
      PersistenceType persistenceType,
      bool isScope,
      dynamic instance});
}

class __$InstanceCopyWithImpl<$Res> extends _$RegistrationCopyWithImpl<$Res>
    implements _$InstanceCopyWith<$Res> {
  __$InstanceCopyWithImpl(_Instance _value, $Res Function(_Instance) _then)
      : super(_value, (v) => _then(v as _Instance));

  @override
  _Instance get _value => super._value as _Instance;

  @override
  $Res call({
    Object name = freezed,
    Object asType = freezed,
    Object persistenceType = freezed,
    Object isScope = freezed,
    Object instance = freezed,
  }) {
    return _then(_Instance(
      name: name == freezed ? _value.name : name as String,
      asType: asType == freezed ? _value.asType : asType as Type,
      persistenceType: persistenceType == freezed
          ? _value.persistenceType
          : persistenceType as PersistenceType,
      isScope: isScope == freezed ? _value.isScope : isScope as bool,
      instance: instance == freezed ? _value.instance : instance as dynamic,
    ));
  }
}

class _$_Instance implements _Instance {
  const _$_Instance(
      {this.name,
      this.asType,
      this.persistenceType,
      this.isScope,
      @required this.instance})
      : assert(instance != null);

  @override
  final String name;
  @override
  final Type asType;
  @override
  final PersistenceType persistenceType;
  @override
  final bool isScope;
  @override
  final dynamic instance;

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

  @override
  _$InstanceCopyWith<_Instance> get copyWith =>
      __$InstanceCopyWithImpl<_Instance>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result instance(String name, Type asType,
            PersistenceType persistenceType, bool isScope, dynamic instance),
    @required
        Result type(
            String name,
            Type asType,
            PersistenceType persistenceType,
            Map<String, dynamic> constructorParameters,
            bool isScope,
            ClassMirror classMirror,
            String constructor),
    @required
        Result factory(
            String name,
            Type asType,
            PersistenceType persistenceType,
            bool isScope,
            dynamic Function(Scope) factory),
  }) {
    assert(instance != null);
    assert(type != null);
    assert(factory != null);
    return instance(name, asType, persistenceType, isScope, this.instance);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result instance(String name, Type asType, PersistenceType persistenceType,
        bool isScope, dynamic instance),
    Result type(
        String name,
        Type asType,
        PersistenceType persistenceType,
        Map<String, dynamic> constructorParameters,
        bool isScope,
        ClassMirror classMirror,
        String constructor),
    Result factory(String name, Type asType, PersistenceType persistenceType,
        bool isScope, dynamic Function(Scope) factory),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (instance != null) {
      return instance(name, asType, persistenceType, isScope, this.instance);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result instance(_Instance value),
    @required Result type(_Type value),
    @required Result factory(_Factory value),
  }) {
    assert(instance != null);
    assert(type != null);
    assert(factory != null);
    return instance(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result instance(_Instance value),
    Result type(_Type value),
    Result factory(_Factory value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (instance != null) {
      return instance(this);
    }
    return orElse();
  }
}

abstract class _Instance implements Registration {
  const factory _Instance(
      {String name,
      Type asType,
      PersistenceType persistenceType,
      bool isScope,
      @required dynamic instance}) = _$_Instance;

  @override
  String get name;
  @override
  Type get asType;
  @override
  PersistenceType get persistenceType;
  @override
  bool get isScope;
  dynamic get instance;
  @override
  _$InstanceCopyWith<_Instance> get copyWith;
}

abstract class _$TypeCopyWith<$Res> implements $RegistrationCopyWith<$Res> {
  factory _$TypeCopyWith(_Type value, $Res Function(_Type) then) =
      __$TypeCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      Type asType,
      PersistenceType persistenceType,
      Map<String, dynamic> constructorParameters,
      bool isScope,
      ClassMirror classMirror,
      String constructor});
}

class __$TypeCopyWithImpl<$Res> extends _$RegistrationCopyWithImpl<$Res>
    implements _$TypeCopyWith<$Res> {
  __$TypeCopyWithImpl(_Type _value, $Res Function(_Type) _then)
      : super(_value, (v) => _then(v as _Type));

  @override
  _Type get _value => super._value as _Type;

  @override
  $Res call({
    Object name = freezed,
    Object asType = freezed,
    Object persistenceType = freezed,
    Object constructorParameters = freezed,
    Object isScope = freezed,
    Object classMirror = freezed,
    Object constructor = freezed,
  }) {
    return _then(_Type(
      name: name == freezed ? _value.name : name as String,
      asType: asType == freezed ? _value.asType : asType as Type,
      persistenceType: persistenceType == freezed
          ? _value.persistenceType
          : persistenceType as PersistenceType,
      constructorParameters: constructorParameters == freezed
          ? _value.constructorParameters
          : constructorParameters as Map<String, dynamic>,
      isScope: isScope == freezed ? _value.isScope : isScope as bool,
      classMirror: classMirror == freezed
          ? _value.classMirror
          : classMirror as ClassMirror,
      constructor:
          constructor == freezed ? _value.constructor : constructor as String,
    ));
  }
}

class _$_Type implements _Type {
  const _$_Type(
      {this.name,
      this.asType,
      this.persistenceType,
      this.constructorParameters,
      this.isScope,
      @required this.classMirror,
      this.constructor = ''})
      : assert(classMirror != null),
        assert(constructor != null);

  @override
  final String name;
  @override
  final Type asType;
  @override
  final PersistenceType persistenceType;
  @override
  final Map<String, dynamic> constructorParameters;
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

  @override
  _$TypeCopyWith<_Type> get copyWith =>
      __$TypeCopyWithImpl<_Type>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result instance(String name, Type asType,
            PersistenceType persistenceType, bool isScope, dynamic instance),
    @required
        Result type(
            String name,
            Type asType,
            PersistenceType persistenceType,
            Map<String, dynamic> constructorParameters,
            bool isScope,
            ClassMirror classMirror,
            String constructor),
    @required
        Result factory(
            String name,
            Type asType,
            PersistenceType persistenceType,
            bool isScope,
            dynamic Function(Scope) factory),
  }) {
    assert(instance != null);
    assert(type != null);
    assert(factory != null);
    return type(name, asType, persistenceType, constructorParameters, isScope,
        classMirror, constructor);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result instance(String name, Type asType, PersistenceType persistenceType,
        bool isScope, dynamic instance),
    Result type(
        String name,
        Type asType,
        PersistenceType persistenceType,
        Map<String, dynamic> constructorParameters,
        bool isScope,
        ClassMirror classMirror,
        String constructor),
    Result factory(String name, Type asType, PersistenceType persistenceType,
        bool isScope, dynamic Function(Scope) factory),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (type != null) {
      return type(name, asType, persistenceType, constructorParameters, isScope,
          classMirror, constructor);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result instance(_Instance value),
    @required Result type(_Type value),
    @required Result factory(_Factory value),
  }) {
    assert(instance != null);
    assert(type != null);
    assert(factory != null);
    return type(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result instance(_Instance value),
    Result type(_Type value),
    Result factory(_Factory value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (type != null) {
      return type(this);
    }
    return orElse();
  }
}

abstract class _Type implements Registration {
  const factory _Type(
      {String name,
      Type asType,
      PersistenceType persistenceType,
      Map<String, dynamic> constructorParameters,
      bool isScope,
      @required ClassMirror classMirror,
      String constructor}) = _$_Type;

  @override
  String get name;
  @override
  Type get asType;
  @override
  PersistenceType get persistenceType;
  Map<String, dynamic> get constructorParameters;
  @override
  bool get isScope;
  ClassMirror get classMirror;
  String get constructor;
  @override
  _$TypeCopyWith<_Type> get copyWith;
}

abstract class _$FactoryCopyWith<$Res> implements $RegistrationCopyWith<$Res> {
  factory _$FactoryCopyWith(_Factory value, $Res Function(_Factory) then) =
      __$FactoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      Type asType,
      PersistenceType persistenceType,
      bool isScope,
      dynamic Function(Scope) factory});
}

class __$FactoryCopyWithImpl<$Res> extends _$RegistrationCopyWithImpl<$Res>
    implements _$FactoryCopyWith<$Res> {
  __$FactoryCopyWithImpl(_Factory _value, $Res Function(_Factory) _then)
      : super(_value, (v) => _then(v as _Factory));

  @override
  _Factory get _value => super._value as _Factory;

  @override
  $Res call({
    Object name = freezed,
    Object asType = freezed,
    Object persistenceType = freezed,
    Object isScope = freezed,
    Object factory = freezed,
  }) {
    return _then(_Factory(
      name: name == freezed ? _value.name : name as String,
      asType: asType == freezed ? _value.asType : asType as Type,
      persistenceType: persistenceType == freezed
          ? _value.persistenceType
          : persistenceType as PersistenceType,
      isScope: isScope == freezed ? _value.isScope : isScope as bool,
      factory: factory == freezed
          ? _value.factory
          : factory as dynamic Function(Scope),
    ));
  }
}

class _$_Factory implements _Factory {
  const _$_Factory(
      {this.name,
      @required this.asType,
      this.persistenceType,
      this.isScope,
      this.factory})
      : assert(asType != null);

  @override
  final String name;
  @override
  final Type asType;
  @override
  final PersistenceType persistenceType;
  @override
  final bool isScope;
  @override
  final dynamic Function(Scope) factory;

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

  @override
  _$FactoryCopyWith<_Factory> get copyWith =>
      __$FactoryCopyWithImpl<_Factory>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result instance(String name, Type asType,
            PersistenceType persistenceType, bool isScope, dynamic instance),
    @required
        Result type(
            String name,
            Type asType,
            PersistenceType persistenceType,
            Map<String, dynamic> constructorParameters,
            bool isScope,
            ClassMirror classMirror,
            String constructor),
    @required
        Result factory(
            String name,
            Type asType,
            PersistenceType persistenceType,
            bool isScope,
            dynamic Function(Scope) factory),
  }) {
    assert(instance != null);
    assert(type != null);
    assert(factory != null);
    return factory(name, asType, persistenceType, isScope, this.factory);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result instance(String name, Type asType, PersistenceType persistenceType,
        bool isScope, dynamic instance),
    Result type(
        String name,
        Type asType,
        PersistenceType persistenceType,
        Map<String, dynamic> constructorParameters,
        bool isScope,
        ClassMirror classMirror,
        String constructor),
    Result factory(String name, Type asType, PersistenceType persistenceType,
        bool isScope, dynamic Function(Scope) factory),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (factory != null) {
      return factory(name, asType, persistenceType, isScope, this.factory);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result instance(_Instance value),
    @required Result type(_Type value),
    @required Result factory(_Factory value),
  }) {
    assert(instance != null);
    assert(type != null);
    assert(factory != null);
    return factory(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result instance(_Instance value),
    Result type(_Type value),
    Result factory(_Factory value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (factory != null) {
      return factory(this);
    }
    return orElse();
  }
}

abstract class _Factory implements Registration {
  const factory _Factory(
      {String name,
      @required Type asType,
      PersistenceType persistenceType,
      bool isScope,
      dynamic Function(Scope) factory}) = _$_Factory;

  @override
  String get name;
  @override
  Type get asType;
  @override
  PersistenceType get persistenceType;
  @override
  bool get isScope;
  dynamic Function(Scope) get factory;
  @override
  _$FactoryCopyWith<_Factory> get copyWith;
}
