import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:needle/needle.dart';
import 'package:source_gen/source_gen.dart';

final imports = <String, ImportTemplate>{};
int prefixNum = 1;

String getPrefix(Element element) {
  final importUri = element.source.uri.toString();
  var importTemplate = imports[importUri];
  if (importTemplate == null) {
    importTemplate = ImportTemplate(importUri, 'prefix${prefixNum++}');
    imports[importUri] = importTemplate;
  }

  return importTemplate.prefix;
}

String getPrefixedName(Element element) {
  if (element.library.isDartAsync || element.library.isDartCore) {
    return element.displayName;
  }

  final prefix = getPrefix(element);
  return '$prefix.${element.displayName}';
}

String buildTypeName(DartType type) {
  final buffer = StringBuffer();
  buffer.write(getPrefixedName(type.element));

  if (type is InterfaceType) {
    if (type.typeArguments.isNotEmpty) {
      buffer.write('<');
      for (var arg in type.typeArguments) {
        buffer.write(buildTypeName(arg));
      }
      buffer.write('>');
    }
  }

  return buffer.toString();
}

class FileTemplate {
  FileTemplate(this.factoryName, this.imports, this.classes);

  final String factoryName;
  final List<ImportTemplate> imports;
  final List<ClassTemplate> classes;

  String get renderedImports {
    final buffer = StringBuffer();
    buffer.writeAll(imports, '\n');

    return buffer.toString();
  }

  String get renderedClasses {
    final buffer = StringBuffer();
    buffer.writeAll(classes, ',\n');

    return buffer.toString();
  }

  @override
  String toString() {
    return '''
import 'package:needle/mirrors.dart';
import 'package:needle/reflection.dart';

$renderedImports 


mixin \$$factoryName {
  Map<Type, ClassMirror> get mirrors => {
$renderedClasses
  };
}
''';
  }
}

class ImportTemplate {
  ImportTemplate(this.uri, this.prefix);

  final String uri;
  final String prefix;

  @override
  String toString() {
    return "import '$uri' as $prefix;";
  }
}

class ClassTemplate {
  factory ClassTemplate(ClassElement classElement) {
    final prefix = getPrefix(classElement);
    final simpleName = classElement.name;
    final qualifiedName = '${classElement.library.name}.$simpleName';
    final constructors = classElement.constructors
        .map((c) => ConstructorTemplate('$prefix.$simpleName', c))
        .toList();

    return ClassTemplate._(prefix, simpleName, qualifiedName, constructors);
  }

  ClassTemplate._(
    this.prefix,
    this.simpleName,
    this.qualifiedName,
    this.constructors,
  );

  final String simpleName;
  final String qualifiedName;
  final String prefix;
  final List<ConstructorTemplate> constructors;

  String get prefixedName => '$prefix.$simpleName';

  String get renderedConstructors {
    final buffer = StringBuffer();
    buffer.writeAll(constructors, ',\n');

    return buffer.toString();
  }

  @override
  String toString() {
    return '''
$prefixedName: ClassMirror(
  $prefixedName,
  {
$renderedConstructors
  },
)''';
  }
}

class ConstructorTemplate {
  factory ConstructorTemplate(
      String className, ConstructorElement constructorElement) {
    final name = constructorElement.name;
    final parameters =
        constructorElement.parameters.map((p) => ParameterTemplate(p)).toList();
    return ConstructorTemplate._(className, name, parameters);
  }

  ConstructorTemplate._(
    this.className,
    this.name,
    this.parameters,
  );

  final String name;
  final String className;
  final List<ParameterTemplate> parameters;

  String get renderedConstructorName {
    if (name != null && name != '') {
      return '$className.$name';
    }

    return className;
  }

  String get renderedParameters {
    final buffer = StringBuffer();
    buffer.writeAll(parameters, ',\n');

    return buffer.toString();
  }

  String get renderedParameterList {
    final buffer = StringBuffer();
    var inNamed = false;
    for (var i = 0; i < parameters.length; i++) {
      if (i != 0) {
        buffer.write(', ');
      }
      final parameter = parameters[i];

      if (parameter.isNamed && !inNamed) {
        buffer.write('{');
        inNamed = true;
      }

      buffer.write(parameter.toFunctionParameter());
    }

    if (inNamed) {
      buffer.write('}');
    }

    return buffer.toString();
  }

  String get renderedConstructorParameters {
    final buffer = StringBuffer();

    buffer.writeAll(parameters.map((p) => p.toConstructorParameter()), ', ');

    return buffer.toString();
  }

  @override
  String toString() {
    return '''
'$name': ConstructorMirror(
  '$name',
  <ParameterMirror>[
$renderedParameters
  ],
  ($renderedParameterList) => $renderedConstructorName($renderedConstructorParameters),
)''';
  }
}

class ParameterTemplate {
  factory ParameterTemplate(ParameterElement parameterElement) {
    final type = parameterElement.type;
    final typeName = buildTypeName(type);
    const reflectChecker = TypeChecker.fromRuntime(Named);
    final attr = reflectChecker.firstAnnotationOf(parameterElement);
    final namedAttribute = attr != null
        ? "const Named('${attr.getField('name').toStringValue()}')"
        : '';

    return ParameterTemplate._(
      parameterElement.name,
      typeName,
      parameterElement.isOptional,
      parameterElement.isNamed,
      parameterElement.defaultValueCode,
      namedAttribute,
    );
  }

  ParameterTemplate._(
    this.name,
    this.typeDeclaration,
    this.isOptional,
    this.isNamed,
    this.defaultValue,
    this.namedAttribute,
  );

  final String name;
  final bool isOptional;
  final bool isNamed;
  final String typeDeclaration;
  final String defaultValue;
  final String namedAttribute;

  String toFunctionParameter() {
    if (defaultValue != null) {
      return '$name = $defaultValue';
    }

    return name;
  }

  String toConstructorParameter() {
    if (isNamed) {
      return '$name: $name';
    }

    return name;
  }

  @override
  String toString() => '''
ParameterMirror(
  '$name', 
  typeOf<$typeDeclaration>(), 
  $isOptional, 
  $isNamed,
  [$namedAttribute],
)''';
}
