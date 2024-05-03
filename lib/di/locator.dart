import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../client/base_client.dart';
import '../feature/example/di/example_dependency.dart';

final appLocator = GetIt.instance;
// final appLocator = GetIt.instance..allowReassignment = true;

void injectorApp() {
  // dependency singleton Dio(library network manager)
  appLocator.registerFactory(
    () => Dio(),
  );

  // appLocator.registerFactory<Dio>(
  //   () => Dio(),
  // );

  // dependency list client for app
  appLocator.registerLazySingleton<BaseClient>(
    () => BaseClient(
      dio: appLocator<Dio>(),
    ),
  );

  ///dependencies for all feature in app
  ExampleDependency().init();
}
