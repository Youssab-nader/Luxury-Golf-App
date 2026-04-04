import 'package:luxury_golf_app/core/Config/app_keys_config.dart';
import 'package:luxury_golf_app/core/Models/service_model.dart';
import 'package:luxury_golf_app/core/Models/user_model.dart';

class CustomerModel extends User {
  final List<ServiceModel> serviceHistory;

  CustomerModel({
    required super.name,
    required super.email,
    required super.photoURL,
    required super.passWord,
    super.isLogined,
    super.phoneNumber,
    required this.serviceHistory,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      AppKeysConfig.userNameKey: name,
      AppKeysConfig.userEmailKey: email,
      AppKeysConfig.userPasswordKey: passWord,
      AppKeysConfig.userPhoneNumKey: phoneNumber,
      AppKeysConfig.userIsLoginedKey: isLogined,
      AppKeysConfig.userPhotoUrlKey: photoURL,
      AppKeysConfig.customerServiceHistoryKey: serviceHistory,
    };
  }

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      name: json[AppKeysConfig.userNameKey],
      email: json[AppKeysConfig.userEmailKey],
      isLogined: json[AppKeysConfig.userIsLoginedKey],
      photoURL: json[AppKeysConfig.userPhotoUrlKey],
      passWord: json[AppKeysConfig.userPasswordKey],
      serviceHistory: json[AppKeysConfig.customerServiceHistoryKey],
    );
  }
}
