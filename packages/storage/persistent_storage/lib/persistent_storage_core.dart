library persistent_storage;

import 'persistent_storage_core.dart';

export 'src/persistent_storage.dart';
export 'src/persistent_storage_dependency.dart';

class PersistentStorageCore {
  static Future init() async {
    await injectorStorage();
  }
}