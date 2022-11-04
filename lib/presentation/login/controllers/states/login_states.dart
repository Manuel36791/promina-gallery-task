import 'package:pro_mina_task/domain/models/user.dart';

class LoginState {
  String? errorMessage;
  UserModel? user;
}

class LoginSuccessState extends LoginState {
  LoginSuccessState(UserModel user) {
    this.user = user;
  }
}

class LoginFailedState extends LoginState {
  LoginFailedState(String errorMessage) {
    this.errorMessage = errorMessage;
  }
}

class LoginLoadingState extends LoginState {}
