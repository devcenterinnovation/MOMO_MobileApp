import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momo/constants.dart';
import 'package:momo/theme.dart';
import 'package:momo/views/signup_screens/login_page.dart';
import 'package:momo/views/signup_screens/personal_information.dart';
import 'package:momo/views/signup_screens/phone_number.dart';
import 'package:momo/widget.dart';


class SignupAndLogin extends StatelessWidget {
  const SignupAndLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(height: 50.h),
            Center(
              child: Padding(
                padding: EdgeInsets.all(20.h),
                child: SizedBox(
                    height: 68.h,
                    width: 69.h,
                    child: Image.asset('assets/images/Momo logo 1.png')),
              ),
            ),
            SizedBox(height: 11.h),
            SizedBox(
                height: 300.h,
                width: 316.w,
                child: Image.asset(
                  'assets/images/business man flyying 2.png',
                  fit: BoxFit.contain,
                )),
            SizedBox(height: 28.h),
            const Text(
              'Get Instant Loan With Low Interest, \nNo Hidden Fees',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  fontFamily: 'Poppins'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 26.h),
              child: Row(
                children: [
                  Expanded(
                    child: customButton(
                        title: 'Sign Up',
                        onPressed: () => Get.to(() => const PhoneNumber())),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: customButton(
                        title: 'Log In',
                        color: WHITE,
                        onPressed: () => Get.to(() => const LoginPage()),
                        borderColor: AppColors.mainColor,
                        textColor: AppColors.mainColor),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}


class WelcomeMemo extends StatefulWidget {
  const WelcomeMemo({Key? key}) : super(key: key);

  @override
  State<WelcomeMemo> createState() => _WelcomeMemoState();
}

class _WelcomeMemoState extends State<WelcomeMemo> {
  bool rememberMe = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 125.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to Momo',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.mainColor,
                  ),
                ),
                SizedBox(height: 36.h),
                Text(
                  'A Terms and Conditions agreement (T&Cs) '
                  'is the agreement \nthat includes the terms, '
                  'the rules and the guidelines of acceptable behavior '
                  'and other useful sections to which users \nmust agree in '
                  'order to use or access your website and mobile app.'
                  '\n\nThis article will get you started with creating your own custom Terms and Conditions agreement. We\'ve also put together a Sample Terms and Conditions Template that you can use to help write your own.\n',
                  style:
                      TextStyle(fontWeight: FontWeight.w400, fontSize: 12.sp),
                ),
                Text(
                  'Location',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.mainColor,
                  ),
                ),
                Text(
                  'This article will get you started with creating your own custom Terms and Conditions agreement.\n',
                  style:
                      TextStyle(fontWeight: FontWeight.w400, fontSize: 12.sp),
                ),
                Text(
                  'Contact',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.mainColor,
                  ),
                ),
                Text(
                  'This article will get you started with creating your own custom Terms and Conditions agreement.',
                  style:
                      TextStyle(fontWeight: FontWeight.w400, fontSize: 12.sp),
                ),
                SizedBox(height: 20.h),
                FormField<bool>(
                  builder: (state) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  rememberMe = value!;
                                });
                              },
                            ),
                            const Text(
                              'I agree to the terms and conditions',
                              style: TextStyle(color: AppColors.buyyyon),
                            )
                          ],
                        ),
                        Text(
                          state.errorText ?? '',
                          style: const TextStyle(
                            color: RED,
                          ),
                        )
                      ],
                    );
                  },
                  validator: (value) {
                    if (!rememberMe) {
                      return 'You need to accept terms and conditions';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 33.h),
                Row(
                  children: [
                    Expanded(
                      child: customButton(
                          title: 'Cancel',
                          color: WHITE,
                          borderColor: AppColors.mainColor,
                          textColor: AppColors.mainColor),
                    ),
                    SizedBox(width: 20.w),
                    Expanded(
                      child: customButton(
                        title: 'Agree',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Get.to(() => const PersonalInformation1());
                            _formKey.currentState!.save();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
