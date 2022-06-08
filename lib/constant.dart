import 'package:flutter/material.dart';

const String emptyEmailField = 'Email field cannot be empty!';
const String emptyTextField = 'Field cannot be empty!';
const String emptyPasswordField = 'Password field cannot be empty';
const String invalidEmailField =
    "Email provided isn\'t valid.Try another email address";
const String passwordLengthError = 'Password length must be greater than 8';
const String invalidPassword =
    'Password must meet have at least \na number, a symbol and a uppercase letter';
const String emptyUsernameField = 'Username  cannot be empty';
const String usernameLengthError = 'Username length must be greater than 6';
const String emailRegex = '[a-zA-Z0-9\+\.\_\%\-\+]{1,256}' +
    '\\@' +
    '[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}' +
    '(' +
    '\\.' +
    '[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}' +
    ')+';
const String passwordRegex =
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
const String upperCaseRegex = r'^(?=.*?[A-Z]).{8,}$';
const String lowerCaseRegex = r'^(?=.*?[a-z]).{8,}$';
const String symbolRegex = r'^(?=.*?[!@#\$&*~]).{8,}$';
const String digitRegex = r'^(?=.*?[0-9]).{8,}$';

const String phoneNumberRegex = r'0[789][01]\d{8}';

const String phoneNumberLengthError = 'Phone number must be 11 digits';

const String invalidPhoneNumberField =
    "Number provided isn\'t valid.Try another phone number";

//MediaQuery Width
double width(BuildContext context) => MediaQuery.of(context).size.width;

//MediaQuery Height
double height(BuildContext context) => MediaQuery.of(context).size.height;

Widget tinnyVerticalSpace() => const SizedBox(height: 5);

Widget smallVerticalSpace() => const SizedBox(height: 10);

Widget verticalSpace() => const SizedBox(height: 30);

Widget largeVerticalSpace(context, {factor = 0.1}) =>
    SizedBox(height: height(context) * factor);

Widget smallHorizontalSpace() => const SizedBox(width: 12);

Widget horizontalSpace() => const SizedBox(width: 20);

Widget mediumHorizontalSpace() => const SizedBox(width: 20);

const double BODY_PADDING = 20.0;
const double TOP_PADDING = 48.0;
