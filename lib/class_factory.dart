import 'package:needle/mirrors.dart';

abstract class ClassFactory {
  ConstructorMirror getConstructor(Type type, [String name = '']) {
    final classMirror = mirrors[type];
    return classMirror.constructors[name];
  }

  dynamic create(ConstructorMirror constructorMirror, List positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    return Function.apply(
        constructorMirror.constructor, positionalArguments, namedArguments);
  }

  Map<Type, ClassMirror> get mirrors;
}
