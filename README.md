# Needle

Needle is a dependency injection library for Dart/Flutter inspired by Autofac ( https://autofac.org/ ).
It uses a generated reflection mechanism to construct registered class by walking their dependency
trees and creating their constructor parameters.

For example, in order to create an instance of `SalesAccountBloc`, the constructor must be provided with
instances of `AgentRepository` and `CustomerRepository`. 
```dart
class SalesAccountBloc {
  SalesAccountBloc({
    this.agentRepository,
    this.customerRepository,
  });

  final AgentRepository agentRepository;
  final CustomerRepository customerRepository;
}
```
Needle uses the generated reflection data to examine the parameters of the `SalesAccountBloc` 
constructor and will see that it requires an instance of `AgentRepository` and `CustomerRepository`.
Needle will then recursively resolve `AgentRepository` and `CustomerRepository` to create instances
to pass to the `SalesAccountBloc` constructor.

When it attempts to resolve and create an instance of `AgentRepository`, it will see that its
constructor requires an instance of `AgentDataStore` and `ObjectCache`. It will then recursively
resolve those two objects.
```dart
class AgentRepository {
  AgentRepository({
    this.dataStore,
    this.objectCache,
  });

  final AgentDataStore dataStore;
  final ObjectCache objectCache;
}
```

Needle uses type registrations to provide information about how to create instances of types,
how the object will be cached, and what interface or base class will be used to reference the
type. For example, the following registers the `AgentRepositoryImpl` class as the class to
be resolved when the `AgentRepository` interface is requested. Additionally, it specifies that
the class will be a singleton.
```dart
builder.registerType<AgentRepositoryImpl>
  .as<AgentRepository>()
  .singleInstance();
```

Similarly, the following registers the `ObjectCache` class and specifies that a new instance
of the class should be created each time the class is resolved.
```dart
builder.registerType<AgentRepositoryImpl>
  .instancePerDependency();
```

Registrations can also be named, allow multiple registrations to be created for a type that
can be specified by constructor parameters using the `@Named` annotation.
```dart
builder.registerType<AgentObjectCache>
  .as<ObjectCache>
  .withName('Agent')
  .singleInstance();

builder.registerType<CustomerObjectCache>
  .as<ObjectCache>
  .withName('Customer')
  .singleInstance();
```
```dart
class AgentRepository {
  AgentRepository({
    this.dataStore,
    @Named('Agent') this.objectCache,
  });

  final AgentDataStore dataStore;
  final ObjectCache objectCache;
}
```

Type registrations can specify other attributes, such as the name of the constructor to
use and a list of parameter values to supply to the constructor.
```dart
builder.registerType<ObjectCache>
  .withConstructor('fixedSize')
  .withParameters({'size': 10})
  .instancePerDependency();
```

If a constructor takes a `Scope` as one of it's parameters, it will be given the 
`Scope` that creates the object. This can be useful if object needs to create
multiple instances of a class. For instance the class might need to create an
instance of another class every time a method is called.

## Getting Started

Needle uses reflection to walk the dependencies of classes. Dart provides a reflection
mechanism, however it is not enabled in the Flutter SDK due to performance concerns and
because it would prevent the use of Flutter's tree-shaking mechanism that reduces the 
size of apps.

Needle overcomes this by using code generation to create `ClassMirror` instances for
classes that have been marked by the `@reflect` or `@ReflectInclude` annotations.
The `ClassMirror` objects provide the registration with information about the constructors
for the class, their parameters, and a function that invokes the constructor.

The `ScopeBuilder` class is used to create registrations and build the root `Scope`
object that is used to resolve classes. `ScopeBuilder` is an class that must be
subclassed to provide a `getMirror()` method that the `ScopeBuilder` uses to 
retrieve the `ClassMirror` for a registration. While this could be done manually,
Needle provides a code generation builder that will generate the `ClassMirror` objects
automatically.

To use the code generation, create a class definition and annotate it with the `@needle`
annotation.
```dart
import 'injection_builder.needle.dart';

@needle
class InjectionBuilder extends $InjectionBuilder {}
```

The class must extend a class whose name is the name of the builder class prefixed
with a `$`. This class will be created during the code generation step. Additionally,
the file must import a file whose name is the same as the source file, but with
an `.needle.dart` extension.

The `.needle.dart` file is created by the code generator and contains the base
class for the builder. This class extends the `ScopeBuilder` class and
provides an implementation of the `getMirror()` method that will return 
`ClassMirror` objects for each class annotated with the `@reflect` annotation.
```dart
@reflect
class AgentRepository {
  AgentRepository({
    this.dataStore,
    this.objectCache,
  });

  final AgentDataStore dataStore;
  final ObjectCache objectCache;
}
```

When it is undesirable or not feasible to annotate a class with the `@reflect`
annotation, such as with classes from a third party library, the `@ReflectInclude`
annotation can be applied to the builder class.
```dart
@ReflectInclude(SomeService)
@needle
class InjectionBuilder extends $InjectionBuilder {}
```

The generated base class for the builder is created using the `build_runner`
package by executing the following command:
```
pub run build_runner build
```

The root `Scope` object is created by creating an instance of the builder class,
registering types with it, and then calling the `build()` method.
```dart
final builder = InjectionBuilder();

builder.registerType<ObjectCache>.instancePerDependency();
builder.registerType<AgentDataStore>.singleInstance();
builder.registerType<AgentRepository>.singleInstance();

final scope = builder.build();

final repository = scope.resolve<AgentRepository>();
```

## Future Features
- Validation will be added to the `ScopeBuilder.build()` method. After the Scope is
built, it walk the dependency trees of every registered class to verify that all of
their dependencies can be provided.
- There is support for creating child `Scope` objects, including `Scope.createScope()`
and `Registrationbuilder.asScope()`. The purpose of this methods is to support the
`PersistenceType.InstancePerScope` lifetime. This needs to be tested and hardened.
- Currently you can provide constructor parameters in the `Registration` using 
the `RegistrationBuilder.withParameters()` method. The plan is to allow parameters
to also be provided to the `Scope.resolve<T>()` method. This will be matched with a 
'RegistrationBuilder.expectParameters()` to indicate in the registration which parameters
must be provided by the client in the `resolve<T>()` method.
