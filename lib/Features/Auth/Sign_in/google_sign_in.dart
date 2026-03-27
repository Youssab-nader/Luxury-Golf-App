import 'dart:convert';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:luxury_golf_app/core/Config/app_keys_config.dart';
import 'package:luxury_golf_app/core/Data/Local_data/local_storage_service.dart';
import 'package:luxury_golf_app/core/Models/user_model.dart';

class SigninWithGoogle {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Future<bool> signIn() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) return false;

      final User user = User(
        name: googleUser.displayName ?? '',
        email: googleUser.email,
        isLogined: true,
        photoURL: googleUser.photoUrl,
        passWord: googleUser.id,
      );
      final Map<String, dynamic> userJsonData = user.toJson();
      final String userStringData = jsonEncode(userJsonData);
      print('User Datat Before Store => $userStringData');
      await PreferencesManager().setString(
        key: AppKeysConfig.userDataKey,
        value: userStringData,
      );
      
      return true;
    } catch (e) {
      return false;
    }
  }
}
