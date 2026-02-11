import 'dart:convert';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:luxury_golf_app/Models/Users%20Models/user_model.dart';
import 'package:luxury_golf_app/Services/local_storage_service.dart';

class SigninWithGoogle {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<bool> signIn() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) return false;

      final user = User(
        name: googleUser.displayName ?? '',
        email: googleUser.email,
        photoURL: googleUser.photoUrl,
        passWord: googleUser.id,
      );

      final storage = LocalStorageService();
      final userDataJson = user.toJson();
      final userDataString = jsonEncode(userDataJson);
      print('User Data : $userDataString');
      await storage.setUserData(userDataString);
      return true;
    } catch (e) {
      print('Google SignIn Error: $e');
      return false;
    }
  }
}
