import 'dart:math';

import 'package:needle/needle.dart';

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

class BarRepository {
  BarRepository(this._dataStore);

  final BarDataStore _dataStore;

  void test() {
    print(_dataStore.size);
  }
}

class FooDataStore {
  FooDataStore(@Named('Foo') this.cache, this.size);
  FooDataStore.large(@Named('Foo') this.cache) : size = 10;
  FooDataStore.small(@Named('Foo') this.cache) : size = 2;

  final ObjectCache cache;
  final int size;
}

class FooRepository {
  FooRepository(this._dataStore);

  final FooDataStore _dataStore;

  void test() {
    print(_dataStore.size);
  }
}

abstract class RepositoryModel {}

class RepositoryModelImpl implements RepositoryModel {
  RepositoryModelImpl(
      {this.fooRepository, this.barRepository, this.fooCache, this.barCache});

  final FooRepository fooRepository;
  final BarRepository barRepository;
  final ObjectCache fooCache;
  final ObjectCache barCache;
}

class SomeService {
  SomeService(this.someField);

  final int someField;
}

class AnotherService {
  AnotherService({this.someField, this.anotherField});

  final int someField;
  final int anotherField;
}
