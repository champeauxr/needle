import 'package:needle/container.dart';
import 'package:needle/needle.dart';

import 'factory.dart';
import 'models.dart';

void main() {
  final builder = ContainerBuilder(MyFactory());

  builder.registerInstance(SomeService(5));

  builder.registerFactory((container) => AnotherService(
        someField: 5,
        anotherField: 6,
      ));

  builder.registerType<FooRepository>().singleInstance();

  builder
      .registerType<FooDataStore>()
      .withConstructor('large')
      .singleInstance();

  builder
      .registerType<BarDataStore>()
      .singleInstance()
      .withParameters({'size': 6});

  builder.registerType<BarRepository>().singleInstance();

  builder
      .registerType<RepositoryModelImpl>()
      .as<RepositoryModel>()
      .singleInstance()
      .withParameters(
          {'fooCache': const Named('Foo'), 'barCache': const Named('Bar')});

  builder.registerType<ObjectCache>().singleInstance().withName('Foo');
  builder.registerType<ObjectCache>().singleInstance().withName('Bar');

  final container = builder.build();

  final obj = container.resolve<RepositoryModel>();

  final barCache = container.resolve<ObjectCache>(name: 'Bar');
  final fooCache = container.resolve<ObjectCache>(name: 'Foo');

  print(barCache);
  print(fooCache);

  print(obj);
}
