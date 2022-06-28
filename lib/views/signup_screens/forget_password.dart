import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momo/constants.dart';
import 'package:momo/custom_text.dart';
import 'package:momo/input_field.dart';
import 'package:momo/theme.dart';
import 'package:momo/validator.dart';
import 'package:momo/views/signup_screens/email_sent.dart';
import 'package:momo/views/signup_screens/login_page.dart';
import 'package:momo/widget.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 90.h),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 68.h,
                        width: 69.h,
                        child: Image.asset('assets/images/Momo logo 1.png')),
                    CustomText(
                      text: 'Forgot your password?',
                      fontWeight: FontWeight.w600,
                    )
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              CustomText(
                text:
                    'Enter your registration email\nto receive password reset instruction',
                fontSize: 12,
                color: AppColors.laon3,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 31.h),
              const Text(
                'Email',
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w400, color: BLACK),
              ),
              InputFormField(
                label: "inyangmatoni@gmail.com",
                validator: (v) => EmailValidator.validateEmail(v),
              ),
              SizedBox(height: 40.h),
              customButton(
                title: 'Send',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Get.to(() => const EmailSent());
                    _formKey.currentState!.save();
                  }
                },
                fontSize: 16.0.sp,
              ),
              SizedBox(height: 11.h),
              InkWell(
                onTap: () => Get.to(() => const LoginPage()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "Remember Password? ",
                      color: const Color(0xFF262626),
                    ),
                    CustomText(
                      text: 'Sign in',
                      fontWeight: FontWeight.w600,
                      color: AppColors.buyyyon,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
