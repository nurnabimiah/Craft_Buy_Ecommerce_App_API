import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main.dart';
import '../screens/email_auth_screen.dart';

class AuthController extends GetxController {
  ///.cart,wish aigole te jaite gele
  ///obossoi login thakte hobe
  bool authState = false;

  //redirectAuthticateuser mane hole aikhane unauthorize user ra dekhe
  void redirectUnAuthticateUser() {
    Navigator.push(CraftyBayApp.navigatorKey.currentContext!,
        MaterialPageRoute(builder: (context) => EmailAuthScreen()));
  }

  bool cheackAuthState() {
    if (authState == false) {
      redirectUnAuthticateUser();
      return false;
    }
    //return true mane holo se login user

    return true;
  }
}
