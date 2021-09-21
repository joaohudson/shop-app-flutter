import 'package:flutter/cupertino.dart';

class LoginBloc {
  final TextEditingController loginController;
  final TextEditingController passwordController;

  LoginBloc(this.loginController, this.passwordController);

  void login() {
    String login = loginController.text;
    String password = passwordController.text;

    print('Login: $login');
    print('Senha: $password');
  }
}
