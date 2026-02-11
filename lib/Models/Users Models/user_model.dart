class User {
  final String name;
  final String email;
  final String? photoURL;
  final String _passWord;

  User({
    required this.name,
    required this.email,
    required this.photoURL,
    required String passWord,
  }) : _passWord = passWord;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'photoURL': photoURL,
      'passWord': _passWord,
    };
  }

  // factory User.fromJson(Map<String, dynamic> json) {
  //   return User(
  //     name: json['name'],
  //     email: json['email'],
  //     photoURL: json['photoURL'],
  //     passWord: json['passWord'],
  //   );
  // }
  // User fromJson(element) {
  //   return User(
  //     name: element['name'],
  //     email: element['email'],
  //     photoURL: element['photoURL'],
  //     passWord: element['passWord'],
  //   );

  // }

   factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      photoURL: json['photoURL'],
      passWord: json['passWord'],
    );
  }
}
