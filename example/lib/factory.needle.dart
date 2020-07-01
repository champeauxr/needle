import 'package:needle/mirrors.dart';
import 'package:needle/reflection.dart';

import 'package:needle_example/models.dart' as prefix1;

mixin $MyFactory {
  Map<Type, ClassMirror> get mirrors => {
        prefix1.ObjectCache: ClassMirror(
          prefix1.ObjectCache,
          {
            '': ConstructorMirror(
              '',
              <ParameterMirror>[],
              () => prefix1.ObjectCache(),
            )
          },
        ),
        prefix1.BarDataStore: ClassMirror(
          prefix1.BarDataStore,
          {
            '': ConstructorMirror(
              '',
              <ParameterMirror>[
                ParameterMirror(
                  'cache',
                  typeOf<prefix1.ObjectCache>(),
                  false,
                  false,
                  [const Named('Bar')],
                ),
                ParameterMirror(
                  'size',
                  typeOf<int>(),
                  false,
                  false,
                  [],
                )
              ],
              (cache, size) => prefix1.BarDataStore(cache, size),
            )
          },
        ),
        prefix1.BarRepository: ClassMirror(
          prefix1.BarRepository,
          {
            '': ConstructorMirror(
              '',
              <ParameterMirror>[
                ParameterMirror(
                  '_dataStore',
                  typeOf<prefix1.BarDataStore>(),
                  false,
                  false,
                  [],
                )
              ],
              (_dataStore) => prefix1.BarRepository(_dataStore),
            )
          },
        ),
        prefix1.FooDataStore: ClassMirror(
          prefix1.FooDataStore,
          {
            '': ConstructorMirror(
              '',
              <ParameterMirror>[
                ParameterMirror(
                  'cache',
                  typeOf<prefix1.ObjectCache>(),
                  false,
                  false,
                  [const Named('Foo')],
                ),
                ParameterMirror(
                  'size',
                  typeOf<int>(),
                  false,
                  false,
                  [],
                )
              ],
              (cache, size) => prefix1.FooDataStore(cache, size),
            ),
            'large': ConstructorMirror(
              'large',
              <ParameterMirror>[
                ParameterMirror(
                  'cache',
                  typeOf<prefix1.ObjectCache>(),
                  false,
                  false,
                  [const Named('Foo')],
                )
              ],
              (cache) => prefix1.FooDataStore.large(cache),
            ),
            'small': ConstructorMirror(
              'small',
              <ParameterMirror>[
                ParameterMirror(
                  'cache',
                  typeOf<prefix1.ObjectCache>(),
                  false,
                  false,
                  [const Named('Foo')],
                )
              ],
              (cache) => prefix1.FooDataStore.small(cache),
            )
          },
        ),
        prefix1.FooRepository: ClassMirror(
          prefix1.FooRepository,
          {
            '': ConstructorMirror(
              '',
              <ParameterMirror>[
                ParameterMirror(
                  '_dataStore',
                  typeOf<prefix1.FooDataStore>(),
                  false,
                  false,
                  [],
                )
              ],
              (_dataStore) => prefix1.FooRepository(_dataStore),
            )
          },
        ),
        prefix1.RepositoryModelImpl: ClassMirror(
          prefix1.RepositoryModelImpl,
          {
            '': ConstructorMirror(
              '',
              <ParameterMirror>[
                ParameterMirror(
                  'fooRepository',
                  typeOf<prefix1.FooRepository>(),
                  true,
                  true,
                  [],
                ),
                ParameterMirror(
                  'barRepository',
                  typeOf<prefix1.BarRepository>(),
                  true,
                  true,
                  [],
                ),
                ParameterMirror(
                  'fooCache',
                  typeOf<prefix1.ObjectCache>(),
                  true,
                  true,
                  [],
                ),
                ParameterMirror(
                  'barCache',
                  typeOf<prefix1.ObjectCache>(),
                  true,
                  true,
                  [],
                )
              ],
              ({fooRepository, barRepository, fooCache, barCache}) =>
                  prefix1.RepositoryModelImpl(
                      fooRepository: fooRepository,
                      barRepository: barRepository,
                      fooCache: fooCache,
                      barCache: barCache),
            )
          },
        )
      };
}
