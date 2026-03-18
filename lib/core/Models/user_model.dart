class User {
  final String name;
  final String email;
   bool isLogined = false;
  final String? photoURL;
  final String passWord;

  User({
    required this.name,
    required this.email,
    required this.photoURL,
    required this. passWord,
    required this.isLogined,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'isLodined': isLogined,
      'photoURL': photoURL,
      'passWord': passWord,
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
      isLogined: json['isLogined'],
      photoURL: json['photoURL'],
      passWord: json['passWord'],
    );
  }
}
