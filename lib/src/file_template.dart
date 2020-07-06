import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:needle/needle.dart';
import 'package:source_gen/source_gen.dart';

final imports = <String, ImportTemplate>{};
int prefixNum = 1;

/// Retrieves the prefix for the element's class.
///
/// If the [element]'s library has already been imported, the prefix for that
/// import is returned. If a new import is created for the [element]'s library,
/// then a new prefix is created and cached.
String getPrefix(Element element) {
  final importUri = element.source.uri.toString();
  var importTemplate = imports[importUri];
  if (importTemplate == null) {
    importTemplate = ImportTemplate(importUri, 'prefix${prefixNum++}');
    imports[importUri] = importTemplate;
  }

  return importTemplate.prefix;
}

/// Returns the name of the [element]'s class with its prefix if the the class
/// is not in the Core or Async library.
String getPrefixedName(Element element) {
  if (element.library.isDartAsync || element.library.isDartCore) {
    return element.displayName;
  }

  final prefix = getPrefix(element);
  return '$prefix.${element.displayName}';
}

/// Builds a type name of [type] using the import prefixes.
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

/// Code generation template for generated file.
class FileTemplate {
  FileTemplate(this.factoryName, this.imports, this.classes);

  final String factoryName;
  final List<ImportTemplate> imports;
  final List<ClassTemplate> classes;

  /// Renders the import templates into the generated code.
  String get renderedImports {
    final buffer = StringBuffer();
    buffer.writeAll(imports, '\n');

    return buffer.toString();
  }

  /// Renders the [ClassMirrors] into the generated code.
  String get renderedClasses {
    final buffer = StringBuffer();
    buffer.writeAll(classes, ',\n');

    return buffer.toString();
  }

  /// Renders the file template into a string.
  @override
  String toString() {
    return '''
import 'package:needle/needle.dart';
import 'package:needle/mirror.dart';

$renderedImports 


class \$$factoryName extends ScopeBuilder {
  @override
  ClassMirror getMirror(Type type) => _mirrors[type];
  
  Map<Type, ClassMirror> get _mirrors => {
$renderedClasses
  };
}
''';
  }
}

/// Code generation template for import statements.
class ImportTemplate {
  ImportTemplate(this.uri, this.prefix);

  final String uri;
  final String prefix;

  /// Renders the import template into a string.
  @override
  String toString() {
    return "import '$uri' as $prefix;";
  }
}

/// Code generation template for [ClassMirror]s.
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

  /// Renders the class template into a string.
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

/// Code generation template for class constructors.
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

  /// Renders the parameter mirrors into a string.
  String get renderedParameters {
    final buffer = StringBuffer();
    buffer.writeAll(parameters, ',\n');

    return buffer.toString();
  }

  /// Renders the parameter list of the constructor lambda method into a string.
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

  /// Renders the parameter list of the constructor call.
  String get renderedConstructorParameters {
    final buffer = StringBuffer();

    buffer.writeAll(parameters.map((p) => p.toConstructorParameter()), ', ');

    return buffer.toString();
  }

  /// Renders the constructor template into a string.
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

/// Code generation template for constructor parameters.
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

  /// Renders the parameter as a function parameter.
  String toFunctionParameter() {
    if (defaultValue != null) {
      return '$name = $defaultValue';
    }

    return name;
  }

  /// Renders the parameter as a constructor invocation parameter.
  String toConstructorParameter() {
    if (isNamed) {
      return '$name: $name';
    }

    return name;
  }

  /// Renders the parameter as a [ParameterMirror].
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
