/// The annotation `@Named()` marks a constructor parameter as resolving
/// to a named instance of an object.
///
/// For example, the `cache` parameter in the following constructor:
/// ```
///class BarDataStore {
///  BarDataStore(@Named('Bar') this.cache, this.size);
///
///  final ObjectCache cache;
///  final int size;
///}
///```
///
/// would be resolved to the object produced by the following registration:
/// ```
/// builder.registerType<ObjectCache>().singleInstance().withName('Bar');
/// ```
class Named {
  const Named(this.name);

  final String name;
}

/// The annotation `@reflect` marks a type for reflection code generation.
const reflect = Reflect();

/// The annotation `@Reflect()` marks a type for reflection code generation.
class Reflect {
  const Reflect();
}

/// The annotation `@ReflectInclude()` marks a factory class and specifies
/// additional types that should be reflected.
///
/// Usage:
/// ```
/// @ReflectInclude(RepositoryModelImpl)
///@ReflectInclude(ObjectCache)
///@factory
///class MyFactory extends ClassFactory with $MyFactory {}
/// ```
class ReflectInclude {
  const ReflectInclude(this.type);

  final Type type;
}

/// The annotation `@needle` marks a class as a Needle ContainerBuilder that
/// build_runner will populate with mirrors of the reflected classes.
const needle = Needle();

/// The annotation `@Needle()` marks a class as a Needle ContainerBuilder that
/// build_runner will populate with mirrors of the reflected classes.
class Needle {
  const Needle();
}
