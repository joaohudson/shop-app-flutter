import 'package:flutter/material.dart';
import 'package:shop/bloc/login-bloc.dart';
import 'package:shop/screens/home-page.dart';

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController loginController =
      TextEditingController(text: 'Login');
  final TextEditingController passwordController =
      TextEditingController(text: 'Senha');
  late LoginBloc loginBloc = LoginBloc(loginController, passwordController);

  void login(BuildContext context) {
    loginBloc.login();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 200.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: loginController,
              ),
              TextField(
                obscureText: true,
                controller: passwordController,
              ),
              TextButton(
                onPressed: () {
                  login(context);
                },
                child: Text('Entrar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
