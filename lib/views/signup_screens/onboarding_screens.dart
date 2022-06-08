import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momo/constants.dart';
import 'package:momo/custom_text.dart';
import 'package:momo/input_field.dart';
import 'package:momo/theme.dart';
import 'package:momo/validator.dart';
import 'package:momo/views/signup_screens/personal_information.dart';
import 'package:momo/views/signup_screens/phone_number.dart';
import 'package:momo/widget.dart';
import 'package:momo/widgets/bottom_menu_nav.dart';

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
                        label: '081 2686 7820 822',
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
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: 43.h),
                      customButton(
                        title: 'Log In',
                        onPressed: () {
                          _formKey.currentState!.validate();
                          Get.offAll(() => const HomeNavigationBar());
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
}

class CreatePassword extends StatefulWidget {
  const CreatePassword({Key? key}) : super(key: key);

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  final passwordController = TextEditingController();

  bool _obscureText = true;

  toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  String _password = "";
  String _confirmPassword = "";

  final _formKey = GlobalKey<FormState>();

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
                const SizedBox(height: 80),
                Center(
                  child: SizedBox(
                      height: 68,
                      width: 69,
                      child: Image.asset('assets/images/Momo logo 1.png')),
                ),
                const SizedBox(height: 12),
                const Center(
                  child: Text(
                    'Create A 6 Digit Password',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 44),
                Padding(
                  padding: const EdgeInsets.only(left: 35.0, right: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Password',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      InputFormField(
                        label: '*****************',
                        controller: passwordController,
                        obscure: _obscureText,
                        onChanged: (val) {
                          setState(() => _password = val);
                        },
                        validator: (v) => PasswordValidator.validatePassword(v),
                        suffixIcon: InkWell(
                            onTap: toggle,
                            child: Icon(_obscureText
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined)),
                      ),
                      const SizedBox(height: 14),
                      const Text(
                        'Confirm Password',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      InputFormField(
                          label: '*****************',
                          keyboardType: TextInputType.number,
                          obscure: true,
                          onChanged: (val) {
                            setState(() => _confirmPassword = val);
                          },
                          validator: (v) {
                            if (v == _password) {
                              Get.to(() => const WelcomeMemo());
                            } else {
                              return "The passwords are not the same";
                            }
                          }),
                      const SizedBox(height: 40),
                      customButton(
                          title: 'Continue',
                          onPressed: () {
                            _formKey.currentState!.validate();
                          })
                    ],
                  ),
                )
              ],
            ),
          ),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE,
      body: SingleChildScrollView(
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
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12.sp),
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
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12.sp),
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
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12.sp),
              ),
              SizedBox(height: 20.h),
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
                        onPressed: () =>
                            Get.to(() => const PersonalInformation1())),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
