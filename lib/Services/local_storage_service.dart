import 'dart:convert';

import 'package:luxury_golf_app/Models/Users%20Models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  Future<void> setUserData(String userData) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString('userData',userData );
  }

  Future<User?> getUserData() async {
    final pref = await SharedPreferences.getInstance();
    final data = pref.getString('userData');

    if (data == null || data.isEmpty) return null;

    return User.fromJson(jsonDecode(data));
  }

  Future<bool> isLogin() async {
    final pref = await SharedPreferences.getInstance();
    final data = pref.getString('userData');

    if (data == null || data.isEmpty) return false;

    return true;
  }
}
