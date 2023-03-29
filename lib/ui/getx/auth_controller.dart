import 'package:craft_buy/data/models/read_profile_model.dart';
import 'package:craft_buy/data/network_utils.dart';
import 'package:craft_buy/ui/getx/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/user_details.dart';
import '../../data/urls.dart';
import '../../main.dart';
import '../screens/email_auth_screen.dart';

class AuthController extends GetxController {
  ///.cart,wish aigole te jaite gele
  ///obossoi login thakte hobe
  bool authState = false;
  bool sendVerificationCodeToEmailInProgress = false;
  bool verifyOtpInProgress = false;
  UserController userController = Get.put(UserController());

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
    update();
    if (response != null && response['msg'] == 'success') {
      return true;
    } else {
      return false;
    }
  }

  // verify otp code send here
  Future<bool> verifyOtp(String email, String otp) async {
    verifyOtpInProgress = true;
    update();
    final response =
        await NetworkUtils().getMethod(Urls.verifyOtpUrl(email, otp));
    verifyOtpInProgress = false;
    update();
    if (response != null && response['msg'] == 'success') {
      await userController.saveUserToken(response['data']);
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
      ReadProfileModel readProfileModel = ReadProfileModel.fromJson(response);
      if ((readProfileModel.data?.length ?? 0) > 0) {
        ProfileData profileData = readProfileModel.data!.first;
        UserDetails userDetails = UserDetails(
            profileData.firstName ?? '',
            profileData.lastName ?? '',
            profileData.shippingAddress ?? '',
            profileData.email!,
            profileData.city ?? '',
            profileData.id!,
            profileData.mobile ?? '');
        userController.saveUserDetails(userDetails);
        return true;
      } else {
        update();
        return false;
      }
    } else {
      return false;
    }
  }
}
