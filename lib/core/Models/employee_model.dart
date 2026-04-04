import 'package:luxury_golf_app/core/Config/app_keys_config.dart';
import 'package:luxury_golf_app/core/Models/permissions_model.dart';
import 'package:luxury_golf_app/core/Models/user_model.dart';

class Employee extends User {
  String id = '';
  final List<Permissions> permissions;
  Employee({
    required super.name,
    required super.email,
    required super.photoURL,
    required super.passWord,
    required super.isLogined,
    required super.phoneNumber,
    required this.permissions,
  }) {
    id = genEmpID();
  }

  String genEmpID() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      AppKeysConfig.userNameKey: name,
      AppKeysConfig.userEmailKey: email,
      AppKeysConfig.userPasswordKey: passWord,
      AppKeysConfig.userPhoneNumKey: phoneNumber,
      AppKeysConfig.userIsLoginedKey: isLogined,
      AppKeysConfig.userPhotoUrlKey: photoURL,
      AppKeysConfig.empIdKey: id,
      AppKeysConfig.empPermissionsKey: permissions.toString(),
    };
  }
}
