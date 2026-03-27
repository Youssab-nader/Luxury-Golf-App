import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:luxury_golf_app/core/Config/app_keys_config.dart';
import 'package:luxury_golf_app/core/Data/Local_data/local_storage_service.dart';
import 'package:luxury_golf_app/core/Models/user_model.dart';

class HomeController extends ChangeNotifier {
  HomeController() {
    loadUserData();
  }

  User user = User(name: '', email: '', photoURL: null, passWord: '');

  void loadUserData() {
    final userDataString = PreferencesManager().getString(
      key: AppKeysConfig.userDataKey,
    );
    user = User.fromJson(jsonDecode(userDataString ?? ''));
    notifyListeners();
  }
}
