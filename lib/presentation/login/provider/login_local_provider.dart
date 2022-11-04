import 'package:pro_mina_task/domain/models/user.dart';
import 'package:pro_mina_task/presentation/managers/constant_manager.dart';
import 'package:pro_mina_task/presentation/managers/storage_manager.dart';

class LoginLocalProvider {
  // get our main storage
  final storage = StorageManager.mainStorage;

  // save user data in local storage and token
  void saveUserData(UserModel user) async {
    await storage.write(ConstantsManager.userKey, user.toJson());
    await storage.write(ConstantsManager.tokenKey, user.token);
  }
}
