Type typeOf<T>() => T;

class ClassMirror {
  const ClassMirror(this.type, this.constructors);

  final Type type;
  final Map<String, ConstructorMirror> constructors;

  Object newInstance(String constructorName, List positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    return Function.apply(constructors[constructorName].constructor,
        positionalArguments, namedArguments);
  }
}

class ConstructorMirror {
  const ConstructorMirror(this.name, this.parameters, this.constructor);

  final String name;
  final List<ParameterMirror> parameters;
  final Function constructor;

  Object newInstance(List positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    return Function.apply(constructor, positionalArguments, namedArguments);
  }
}

class ParameterMirror {
  const ParameterMirror(
      this.name, this.type, this.isOptional, this.isNamed, this.metadata);

  final String name;
  final Type type;
  final bool isOptional;
  final bool isNamed;
  final List<dynamic> metadata;
}
