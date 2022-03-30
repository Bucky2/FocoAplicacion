import 'package:flutter/material.dart';

class HomeController {
  BuildContext context;

  //Constructor
  Future init(BuildContext context) {
    this.context = context;
  }

  void goToWifiPage() {
    Navigator.pushNamed(context, 'wifi');
  }

   void goToBluePage() {
    Navigator.pushNamed(context, 'blue');
  }

}
