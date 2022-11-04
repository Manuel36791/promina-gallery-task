import 'package:get_storage/get_storage.dart';

import 'constant_manager.dart';

class StorageManager {
  static final mainStorage = GetStorage(ConstantsManager.mainStorage);

  static Future<void> initStorages() async {
    await GetStorage.init(ConstantsManager.mainStorage);
  }
}
