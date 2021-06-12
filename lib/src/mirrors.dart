/// Allows Type literals to be declared for generic types.
Type typeOf<T>() => T;

/// Mirror class representing a class and its constructors.
class ClassMirror {
  /// Creates and instance of the [ClassMirror] with the [type] and a map
  /// of [constructors].
  const ClassMirror(this.type, this.constructors);

  final Type type;
  final Map<String, ConstructorMirror> constructors;

  /// Creates a new instance of the class using the constructor named
  /// [constructorName] and with the [positionalArguments] and [namedArguments].
  Object newInstance(String constructorName, List positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    return Function.apply(constructors[constructorName]!.constructor,
        positionalArguments, namedArguments);
  }
}

/// Mirror class representing a class constructor.
class ConstructorMirror {
  /// Creates an instance of the [ConstuctorMirror] with a [name], list of
  /// [parameters], and the [constructor] function.
  const ConstructorMirror(this.name, this.parameters, this.constructor);

  final String name;
  final List<ParameterMirror> parameters;
  final Function constructor;

  /// Creates a new instance of the class by calling the constructor function
  /// with the [positionalArguments] and [namedArguments].
  Object newInstance(List positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    return Function.apply(constructor, positionalArguments, namedArguments);
  }
}

/// Mirror class representing a constructor parameter.
class ParameterMirror {
  /// Creates an instance of the [ParameterMirror]
  const ParameterMirror(
      this.name, this.type, this.isOptional, this.isNamed, this.metadata);

  final String name;
  final Type type;
  final bool isOptional;
  final bool isNamed;
  final List<dynamic> metadata;
}
