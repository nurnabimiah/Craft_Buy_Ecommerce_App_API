import 'dart:convert';

import 'package:craft_buy/data/models/user_details.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ai controller ta decide nibe user login kora ase kina

class UserController extends GetxController {
  bool loggedIn = false;
  UserDetails? userDetails;
  //user details jodi null thake tahole eita login kora nai

  // user token na niye gele seita user k unatuhorized dekhabe
  String? userToken;

  // user er details golo se eikahne save kore rakhbe
  Future<void> saveUserDetails(UserDetails uDetails) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('user', jsonEncode(uDetails.toJson()));
    userDetails = uDetails;
  }

  /// token save

  Future<void> saveUserToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', token);
    userToken = token;
  }

  Future<void> getUserToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userToken = sharedPreferences.getString('token');
  }

  // dekhbe user logged in obostai ase kina
  // jodi thake tahole se ai method ti call korbe

  Future<void> getUserDetails() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String user = sharedPreferences.getString('user') ?? '';
    userDetails = UserDetails.fromJson(jsonDecode(user));
  }
}

/// when we data insert we use to encode
/// otherwise when we read data we use to decode
