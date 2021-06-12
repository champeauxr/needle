import 'dart:math';

import 'package:needle/needle.dart';

import 'main.needle.dart';

@ReflectInclude(AnotherService)
@needle
class Builder extends $Builder {}

void main() {
  final builder = Builder();
  builder.setLogger((message) => print(message));

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

  final repositoryModel = container.resolve<RepositoryModel>();

  final barCache = container.resolve<ObjectCache>(name: 'Bar');
  final fooCache = container.resolve<ObjectCache>(name: 'Foo');

  final repositoryModelCopy = container.resolve<RepositoryModel>();

  print(repositoryModel);
  print(barCache);
  print(fooCache);
  print(repositoryModelCopy);
}

@reflect
class ObjectCache {
  final cache = <dynamic>[];
  final id = Random().nextInt(1000);
}

@reflect
class BarDataStore {
  BarDataStore(@Named('Bar') this.cache, this.size);

  final ObjectCache cache;
  final int size;
}

@reflect
class BarRepository {
  BarRepository(this._dataStore);

  final BarDataStore _dataStore;

  void test() {
    print(_dataStore.size);
  }
}

@reflect
class FooDataStore {
  FooDataStore(@Named('Foo') this.cache, this.size);
  FooDataStore.large(@Named('Foo') this.cache) : size = 10;
  FooDataStore.small(@Named('Foo') this.cache) : size = 2;

  final ObjectCache cache;
  final int size;
}

@reflect
class FooRepository {
  FooRepository(this._dataStore);

  final FooDataStore _dataStore;

  void test() {
    print(_dataStore.size);
  }
}

abstract class RepositoryModel {}

@reflect
class RepositoryModelImpl implements RepositoryModel {
  RepositoryModelImpl(
      {required this.fooRepository,
      required this.barRepository,
      required this.fooCache,
      required this.barCache});

  final FooRepository fooRepository;
  final BarRepository barRepository;
  final ObjectCache fooCache;
  final ObjectCache barCache;
}

@reflect
class SomeService {
  SomeService(this.someField);

  final int someField;
}

class AnotherService {
  AnotherService({required this.someField, required this.anotherField});

  final int someField;
  final int anotherField;
}

class AgentDataStore {
  AgentDataStore();
}

class AgentRepository {
  AgentRepository({
    required this.dataStore,
    required this.objectCache,
  });

  final AgentDataStore dataStore;
  final ObjectCache objectCache;
}

class CustomerDataStore {
  CustomerDataStore();
}

class CustomerRepository {
  CustomerRepository({
    required this.dataStore,
    required this.objectCache,
  });

  final CustomerDataStore dataStore;
  final ObjectCache objectCache;
}

class SalesAccountBloc {
  SalesAccountBloc({
    required this.agentRepository,
    required this.customerRepository,
  });

  final AgentRepository agentRepository;
  final CustomerRepository customerRepository;
}
