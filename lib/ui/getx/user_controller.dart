import 'dart:convert';

import 'package:craft_buy/data/models/user_details.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ai controller ta decide nibe user login kora ase kina

class UserController extends GetxController {
  bool loggedIn = false;

  // user er details golo se eikahne save kore rakhbe
  Future<void> saveUserDetails(UserDetails userDetails) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('user', jsonEncode(userDetails.toJson()));
  }

  // dekhbe user logged in obostai ase kina
  // jodi thake tahole se ai method ti call korbe

  /* Future<void> getUserDetails() {}*/
}
