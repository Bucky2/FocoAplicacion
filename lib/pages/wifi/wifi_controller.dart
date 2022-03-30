import 'package:flutter/material.dart';

class WifiController {
  BuildContext context;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  get registro => null;

  Future init(BuildContext context) {
    this.context = context;
  }

  void wifi() {
    String email = emailController.text;
    String password = passwordController.text;

    print('Email: $email y password es: $password');
  }
    void goToRegisterPage() {
    Navigator.pushNamed(context, 'registro');
  }
  void goToFoquilloPage() {
    Navigator.pushNamed(context, 'foquillo');
  }
}
