import 'package:luxury_golf_app/core/Config/app_keys_config.dart';

class User {
  final String name;
  final String email;
  final String? photoURL;
  final String passWord;
  bool isLogined;

  User({
    required this.name,
    required this.email,
    required this.photoURL,
    required this.passWord,
    this.isLogined = false,
  });

  Map<String, dynamic> toJson() {
    return {
      AppKeysConfig.userNameKey: name,
      AppKeysConfig.userEmailKey: email,
      AppKeysConfig.userIsLoginedKey: isLogined,
      AppKeysConfig.userPhotoUrlKey: photoURL,
      AppKeysConfig.userPasswordKey: passWord,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json[AppKeysConfig.userNameKey],
     email: json[AppKeysConfig.userEmailKey],
      isLogined:json[AppKeysConfig.userIsLoginedKey],
      photoURL:json[AppKeysConfig.userPhotoUrlKey],
      passWord:json[AppKeysConfig.userPasswordKey]
    );
  }

  String getFirstName() {
    String firstName = '';
    for (int i = 0; i < name.length; i++) {
      if (name[i] == ' ') {
        break;
      }
      firstName += name[i];
    }

    return firstName;
  }
}
