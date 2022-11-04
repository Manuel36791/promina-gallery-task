import 'dart:developer';

import 'package:pro_mina_task/data/dio/dio_helper.dart';
import 'package:pro_mina_task/data/help_functions/help_functions.dart';
import 'package:pro_mina_task/domain/models/user.dart';
import 'package:pro_mina_task/presentation/login/controllers/states/login_states.dart';
import 'package:pro_mina_task/presentation/login/provider/login_local_provider.dart';
import 'package:pro_mina_task/presentation/managers/strings_manager.dart';
import 'package:pro_mina_task/presentation/managers/url_manager.dart';

class LoginRemoteProvider {
  DioHelper helper = DioHelper();
  LoginLocalProvider localProvider = LoginLocalProvider();

  Future<LoginState> login(String email, String password) async {
    try {
      // show waiting indicator
      showWaitingIndicator(StringsManager.pleaseWait);

      // send data to login and wait for response
      final response = await helper.postData(UrlManager.loginEndPoint, {
        "email": email,
        "password": password,
      });

      // if response is sucess we return the data and save it to local storage
      if (response['error_message'] == null) {
        localProvider.saveUserData(UserModel.fromJson(response));
        return LoginSuccessState(UserModel.fromJson(response));
      }
      // else we return error and show the error message
      else {
        showErrorToast(response['error_message'] ?? StringsManager.tryAgain);
        return LoginFailedState(
            response['error_message'] ?? StringsManager.tryAgain);
      }
    } catch (e) {
      log(e.toString());
      return LoginFailedState(e.toString());
    } finally {
      hideWaitingIndicator();
    }
  }
}
