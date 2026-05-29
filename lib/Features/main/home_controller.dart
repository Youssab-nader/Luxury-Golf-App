import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:luxury_golf_app/core/Config/app_keys_config.dart';
import 'package:luxury_golf_app/core/Data/Local_data/local_storage_service.dart';
import 'package:luxury_golf_app/core/Models/customer_model.dart';

class HomeController extends ChangeNotifier {
  HomeController() {
    loadUserData();
  }

  CustomerModel customer = CustomerModel(
    name: '',
    email: '',
    photoURL: '',
    passWord: '',
    phoneNumber: '',
    serviceHistory: [],
  );

  void loadUserData() async {
    final userDataString = PreferencesManager().getString(
      key: AppKeysConfig.userDataKey,
    );
    customer = CustomerModel.fromJson(jsonDecode(userDataString ?? ''));
    await PreferencesManager().setString(key: AppKeysConfig.userNameKey, value: customer.name);
    notifyListeners();
  }
}
