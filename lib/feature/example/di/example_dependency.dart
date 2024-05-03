import '../../../di/base_dependencies.dart';
import '../../../di/locator.dart';
import '../data/api/example_api.dart';
import '../data/repository/example_repository.dart';

class ExampleDependency implements BaseDependencies {
  @override
  apiDependency() {
    appLocator.registerFactory<ExampleApi>(
      () => ExampleApiImpl(
        baseClient: appLocator(),
      ),
    );
  }

  @override
  repositoryDependency() {
    appLocator.registerLazySingleton<ExampleRepository>(
      () => ExampleRepositoryImpl(
        exampleApi: appLocator(),
      ),
    );
  }

  @override
  init() {
    apiDependency();
    repositoryDependency();
  }
}
