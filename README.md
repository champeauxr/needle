# needle

A dependency injection library for Dart/Flutter inspired by AutoFac (https://autofac.org/)

## Getting Started

Needle is a dependency injection that uses a generated reflection mechanism to construct
registered objects by walking its dependency tree and creating its dependents.

At its core, Needle uses code generation to reflect classes to be injected and create a
class factory that provides information about the class constructors and their parameters.

The factory class is identified with the `@factory` attribute.
```dart
@factory
class MyFactory extends ClassFactory with $MyFactory {}
```

Classes to be reflected are identified by either annotating them with the `@reflect` annotation:
```dart
@reflect
class ObjectCache {}
```

or by adding the `@ReflectInclude` annotation to the factory class:
```dart
@ReflectInclude(ObjectCache)
@factory
class MyFactory extends ClassFactory with $MyFactory {}
```

Generate the class factory by running the following command:
```
pub run build_runner build
```

## Registering Classes

Classes are registered with Needle using a `ContainerBuilder`.

Create a builder and pass it a ClassFactory.
```dart
  final builder = ContainerBuilder(MyFactory());
```

- Register an instance of an object
```dart
  builder.registerInstance(SomeService(5));
```

- Register a factory method
```dart
  builder.registerFactory((container) => AnotherService(
        someField: 5,
        anotherField: 6,
      ));
```

- Register a type as a singleton
```dart
  builder.registerType<FooRepository>().singleInstance();
```

- Register a type so that a new instance is created for each request
```dart
  builder.registerType<FooRepository>().instancePerDependency();

```

- Register a concrete type as an interface
```dart
  builder
      .registerType<RepositoryModelImpl>()
      .as<RepositoryModel>()
      .singleInstance();
```

- Register a type using a named constructor
```dart
  builder
      .registerType<FooDataStore>()
      .withConstructor('large')
      .singleInstance();
```

- Specify values for constructor parameters
```dart
  builder
      .registerType<BarDataStore>()
      .singleInstance()
      .withParameters({'size': 6});
```

- Register named instances
```dart
  builder.registerType<ObjectCache>().singleInstance().withName('Foo');
  builder.registerType<ObjectCache>().singleInstance().withName('Bar');
```

## Building the Container and Resolving Objects

Once the classes are registered, a `Container` is created from the builder:
```dart
  final container = builder.build();
```

Object can be resolved with:
```dart
  final obj = container.resolve<RepositoryModel>();

  final barCache = container.resolve<ObjectCache>(name: 'Bar');
  final fooCache = container.resolve<ObjectCache>(name: 'Foo');
```

When a object is created by Needle, it recursively resolves the constructor parameters of
the object.

For instance when `BarRepository` is resolved, it will first create `BarDataStore` if it hasn't
already been created.
```dart
class BarRepository {
  BarRepository(this._dataStore);

  final BarDataStore _dataStore;

  void test() {
    print(_dataStore.size);
  }
}

class BarDataStore {
  BarDataStore(@Named('Bar') this.cache, this.size);

  final ObjectCache cache;
  final int size;
}
```

Constructor parameters of a registered class can specify a named instance with the
`@Named` attribute.

```dart
class BarDataStore {
  BarDataStore(@Named('Bar') this.cache, this.size);

  final ObjectCache cache;
  final int size;
}
```
