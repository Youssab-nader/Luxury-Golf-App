
import 'package:google_sign_in/google_sign_in.dart';
import 'package:luxury_golf_app/core/Models/customer_model.dart';

class SigninWithGoogle {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Future<bool> signIn() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) return false;
      final CustomerModel newCustomer = CustomerModel(
        name: googleUser.displayName ?? '',
        email: googleUser.email,
        phoneNumber: null,
        isLogined: true,
        photoURL: googleUser.photoUrl,
        passWord: googleUser.id,
        serviceHistory: [],
      );
      // final Map<String, dynamic> custJsonData = newCustomer.toJson();
      // final String userStringData = jsonEncode(custJsonData);
      // print('User Datat Before Store => $userStringData');
      // await PreferencesManager().setString(
      //   key: AppKeysConfig.userDataKey,
      //   value: userStringData,
      // );

      return true;
    } catch (e) {
      return false;
    }
  }
}
