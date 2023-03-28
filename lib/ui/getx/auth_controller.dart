import 'package:craft_buy/data/network_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/urls.dart';
import '../../main.dart';
import '../screens/email_auth_screen.dart';

class AuthController extends GetxController {
  ///.cart,wish aigole te jaite gele
  ///obossoi login thakte hobe
  bool authState = false;
  bool sendVerificationCodeToEmailInProgress = false;
  bool verifyOtpInProgress = false;
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

  Future<bool> sendVerificationCodeToEmail(String email) async {
    sendVerificationCodeToEmailInProgress = true;
    update();
    final response =
        await NetworkUtils().getMethod(Urls.sendOtpToEmailUrl(email));
    sendVerificationCodeToEmailInProgress = false;
    if (response != null && response['msg'] == 'success') {
      return true;
    } else {
      return false;
    }
  }

  // verify otp code send here
  Future<bool> vertifyOpp(String email, String otp) async {
    verifyOtpInProgress = true;
    update();
    final response =
        await NetworkUtils().getMethod(Urls.verifyOtpUrl(email, otp));
    verifyOtpInProgress = false;
    if (response != null && response['msg'] == 'success') {
      return true;
    } else {
      return false;
    }
  }

  // readProfile send here
  Future<bool> readProfileDetails() async {
    verifyOtpInProgress = true;
    update();
    final response =
        await NetworkUtils().getMethod(Urls.readProfileDeatailsUrl);
    verifyOtpInProgress = false;
    if (response != null && response['msg'] == 'success') {
      return true;
    } else {
      return false;
    }
  }
}
