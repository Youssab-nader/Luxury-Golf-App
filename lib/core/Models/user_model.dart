abstract class User {
  final String name;
  final String? phoneNumber;
  final String email;
  final String? photoURL;
  final String passWord;
  bool isLogined;

  User({
    required this.name,
    required this.email,
    required this.photoURL,
    required this.passWord,
    required this.phoneNumber,
    this.isLogined = false,
  });

  Map<String, dynamic> toJson();

    // factory User.fromJson(Map<String, dynamic> json) {
    //   return User(
    //     name: json[AppKeysConfig.userNameKey],
    //    email: json[AppKeysConfig.userEmailKey],
    //     isLogined:json[AppKeysConfig.userIsLoginedKey],
    //     photoURL:json[AppKeysConfig.userPhotoUrlKey],
    //     passWord:json[AppKeysConfig.userPasswordKey]
    //   );
    // }

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
