import 'dart:convert';

import 'package:luxury_golf_app/core/Models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  Future<void> setUserData(String userData) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString('userData', userData);
  }

  Future<User?> getUserData() async {
    final pref = await SharedPreferences.getInstance();
    final data = pref.getString('userData');

    if (data == null || data.isEmpty) return null;

    return User.fromJson(jsonDecode(data));
  }

  Future<void> setEmpData(String empData) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString('empData', empData);
  }

  Future<String> getEmpData() async {
    final pref = await SharedPreferences.getInstance();
    final String empData =  pref.getString('empData') ?? 'null';
    return empData;
  }
  
  Future<bool> isLogin() async {


    return true;
  }
}
