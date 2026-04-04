import 'package:luxury_golf_app/core/Models/validation_massages.dart';

class ValidationsConfig {
  static final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  static final RegExp _passwordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{6,}$',
  );
  static final RegExp _egyptPhoneRegex = RegExp(r'^01[0125][0-9]{8}$');

  static String? Function(String?)? phoneValidation() {
    return (String? input) {
      if (input == null || input.isEmpty) {
        return ValidationMessages.phoneRequired;
      } else if (!_egyptPhoneRegex.hasMatch(input)) {
        return ValidationMessages.invalidPhone;
      }
      return null;
    };
  }

  static String? Function(String?)? emailValidation() {
    return (String? input) {
      if (input == null || input.isEmpty) {
        return ValidationMessages.emailRequired;
      } else if (!_emailRegex.hasMatch(input)) {
        return ValidationMessages.invalidEmail;
      }
      return null;
    };
  }

  static String? Function(String?)? passwordValidation() {
    return (String? input) {
      if (input == null || input.isEmpty) {
        return ValidationMessages.passwordRequired;
      } else if (!_passwordRegex.hasMatch(input)) {
        return ValidationMessages.passwordWeak;
      }
      return null;
    };
  }
}
