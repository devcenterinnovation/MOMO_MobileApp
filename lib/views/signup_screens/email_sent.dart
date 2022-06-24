import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momo/constants.dart';
import 'package:momo/custom_text.dart';
import 'package:momo/views/signup_screens/forget_password.dart';
import 'package:momo/views/signup_screens/onboarding_screens.dart';
import 'package:momo/widget.dart';

class EmailSent extends StatelessWidget {
  const EmailSent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          children: [
            SizedBox(height: 90.h),
            Center(
              child: SizedBox(
                  height: 68.h,
                  width: 69.h,
                  child: Image.asset('assets/images/Momo logo 1.png')),
            ),
            SizedBox(height: 2.h),
            CustomText(
              text: 'Email Sent!',
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 10.h),
            CustomText(
              text:
                  'Enter your registration email\nto receive password reset instruction',
              fontSize: 12,
              color: AppColors.laon3,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            SizedBox(
                height: 207.h,
                width: 196.w,
                child: Image.asset(
                  'assets/images/business man flyying 2.png',
                  fit: BoxFit.contain,
                )),
            SizedBox(height: 40.h),
            customButton(
                title: 'Login',
                fontSize: 16.0.sp,
                onPressed: () {
                  Get.to(() => const LoginPage());
                }),
            SizedBox(height: 11.h),
            InkWell(
              onTap: () => Get.to(() => const ForgetPassword()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Didn't receive the link? ",
                    color: const Color(0xFF262626),
                  ),
                  CustomText(
                    text: 'Resend',
                    fontWeight: FontWeight.w600,
                    color: AppColors.buyyyon,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
