import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:dart_style/dart_style.dart';
import 'package:glob/glob.dart';
import 'package:needle/reflection.dart';
import 'package:source_gen/source_gen.dart';

import 'file_template.dart';

Builder factoryBuilder(BuilderOptions options) => FactoryBuilder();

class FactoryBuilder implements Builder {
  static const generatedExtension = '.needle.dart';

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final libraryReader = LibraryReader(await buildStep.inputLibrary);
    final generator = FactoryGenerator();
    final str = await generator.generate(libraryReader, buildStep);
    if (str != null && str != '') {
      final formatter = DartFormatter();

      final formatted = formatter.format(str);
      final outputId = buildStep.inputId.changeExtension(generatedExtension);

      await buildStep.writeAsString(outputId, formatted);
    }
  }

  @override
  Map<String, List<String>> get buildExtensions => {
        '.dart': [generatedExtension]
      };
}

class FactoryGenerator extends GeneratorForAnnotation<Factory> {
  static final _allFilesInLib = Glob('lib/**');

  @override
  FutureOr<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    final classes = <ClassTemplate>[];

    const includeChecker = TypeChecker.fromRuntime(ReflectInclude);

    final includeTypes = <DartType>[];

    for (var annotation in includeChecker.annotationsOf(element)) {
      final type = annotation.getField('type').toTypeValue();
      includeTypes.add(type);
    }

    await for (final input in buildStep.findAssets(_allFilesInLib)) {
      final libraryElement = await buildStep.resolver.libraryFor(input);
      final library = LibraryReader(libraryElement);

      const reflectChecker = TypeChecker.fromRuntime(Reflect);

      for (final classElement in library.classes) {
        if (!includeTypes.contains(classElement.thisType) &&
            !reflectChecker.hasAnnotationOf(classElement)) {
          continue;
        }

        classes.add(ClassTemplate(classElement));
      }
    }

    final importList = imports.values.toList();
    final fileTemplate = FileTemplate(element.displayName, importList, classes);

    return fileTemplate.toString();
  }
}
