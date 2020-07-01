import 'package:needle/needle.dart';
import 'package:needle_example/models.dart';

import 'factory.needle.dart';

@ReflectInclude(FooDataStore)
@ReflectInclude(FooRepository)
@ReflectInclude(BarDataStore)
@ReflectInclude(BarRepository)
@ReflectInclude(RepositoryModelImpl)
@ReflectInclude(ObjectCache)
@factory
class MyFactory extends ClassFactory with $MyFactory {}
