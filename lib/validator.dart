import 'constant.dart';

class EmailValidator {
  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return emptyEmailField;
    }
    // Regex for email validation
    final regExp = RegExp(emailRegex);
    final regExp2 = RegExp(emailRegex2);
    if (regExp.hasMatch(value) || regExp2.hasMatch(value)) {
      return null;
    }
    return invalidEmailField;
  }
}

class PhoneNumberValidator {
  static String? validatePhoneNumber(String value) {
    if (value.isEmpty) {
      return emptyTextField;
    }
    // Regex for phone number validation
    final regExp = RegExp(phoneNumberRegex);
    print(regExp.hasMatch(value));
    if (regExp.hasMatch(value)) {
      return null;
    }
    return phoneNumberLengthError;
  }
}

class PasswordValidator {
  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return emptyPasswordField;
    }
    if (value.length < 8) {
      return passwordLengthError;
    }
    final regExp = RegExp(passwordRegex);

    // if (!regExp.hasMatch(value)) {
    //   return invalidPassword;
    // }

    return null;
  }
}

class UsernameValidator {
  static String? validateUsername(String value) {
    if (value.isEmpty) {
      return emptyUsernameField;
    }

    if (value.length < 6) {
      return usernameLengthError;
    }

    return null;
  }
}

class NumberValidator {
  static String? validateNumber(String value) {
    if (value.isEmpty) {
      return emptyPhoneNumberField;
    }

    if (value.length < 10) {
      return numberLengthError;
    }

    return null;
  }
}

class FieldValidator {
  static String? validate(String value) {
    if (value.isEmpty) {
      return emptyTextField;
    }

    return null;
  }
}
