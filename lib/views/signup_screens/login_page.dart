import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momo/constants.dart';
import 'package:momo/controllers/user_controller.dart';
import 'package:momo/custom_text.dart';
import 'package:momo/dialogs_snackbar.dart';
import 'package:momo/input_field.dart';
import 'package:momo/services/auth_services.dart';
import 'package:momo/services/internet_services.dart';
import 'package:momo/validator.dart';
import 'package:momo/views/signup_screens/forget_password.dart';
import 'package:momo/views/signup_screens/phone_number.dart';
import 'package:momo/widget.dart';
import 'package:momo/widgets/bottom_menu_nav.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  final numberController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 90.h),
                Center(
                  child: SizedBox(
                      height: 68.h,
                      width: 69.w,
                      child: Image.asset('assets/images/Momo logo 1.png')),
                ),
                Center(
                  child: Text(
                    'Provide your phone number and\npassword to access your account',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
                  ),
                ),
                SizedBox(height: 53.h),
                Padding(
                  padding: const EdgeInsets.only(left: 35.0, right: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Phone Number',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w400),
                      ),
                      InputFormField(
                        label: '0815 044 3017',
                        validator: (v) =>
                            PhoneNumberValidator.validatePhoneNumber(v),
                        controller: numberController,
                        keyboardType: TextInputType.phone,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                      ),
                      SizedBox(height: 14.h),
                      Text(
                        'Password',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w400),
                      ),
                      InputFormField(
                        label: '*****************',
                        controller: passwordController,
                        obscure: _obscureText,
                        validator: (v) => PasswordValidator.validatePassword(v),
                        suffixIcon: InkWell(
                            onTap: toggle,
                            child: Icon(_obscureText
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined)),
                      ),
                      SizedBox(height: 10.h),
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () => Get.to(() => const ForgetPassword()),
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 43.h),
                      customButton(
                        title: 'Log In',
                        onPressed: () {
                          _submit(context);
                        },
                        fontSize: 16.0.sp,
                      ),
                      SizedBox(height: 11.h),
                      GestureDetector(
                        onTap: () => Get.to(() => const PhoneNumber()),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: "Don't have an account? ",
                            ),
                            CustomText(
                              text: 'Sign Up',
                              fontWeight: FontWeight.w600,
                              color: AppColors.buyyyon,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void _submit(context) async {
    if (await InternetUtils.checkConnectivity()) {
      loadingDialog(context);

      var response = await AuthenticationService.login(
          numberController.text, passwordController.text);

      if (response is String) {
        Get.back();
        if (response.contains('HttpException') || response.contains('Socket')) {
          showErrorSnackBar('Error!', 'Failed to log in, please try again');
        } else {
          showErrorSnackBar('Error!', 'Invalid email/password, try again');
        }
      } else {
        String userId = response["user_id"];
        String token = response[""];

        UserController userController =
            Get.put(UserController(), permanent: true);
        await userController.setUserId(userId);
        await userController.setToken(token);
        var userResponse = await AuthenticationService.getUser(token, userId);
        print(userResponse);
        print(userId);

        if (userResponse is String) {
          showErrorSnackBar('Error!', 'Failed to log in, please try again');
        } else {
          await userController.setUserDetail(userResponse['profile']);
          await userController.setUserWallet(userResponse['wallet']);
          await userController.setReferralId(userResponse["referral_id"]);

          Get.offAll(() => const HomeNavigationBar());
        }
      }
    } else {
      showErrorSnackBar(
          'No Internet!', 'Please check your internet connection.');
    }
  }
}
