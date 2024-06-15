import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'persistent_storage.dart';

final persistentStorageLocator = GetIt.instance;

Future injectorStorage() async {
  await injectorShared();
  persistentStorageLocator.registerFactory<PersistentStorage>(
    () => PersistentStorage(
      sharedPreferences: persistentStorageLocator(),
    ),
  );
}

Future injectorShared() async {
  final prefs = await SharedPreferences.getInstance();
  persistentStorageLocator.registerSingleton<SharedPreferences>(prefs);
}
