import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momo/controllers/user_controller.dart';
import 'package:momo/custom_text.dart';
import 'package:momo/views/signup_screens/login_page.dart';
import 'package:momo/widget.dart';

class GetStarted extends StatefulWidget {
  GetStarted({
    Key? key,
  }) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  String userId = '';

  UserController userController = Get.find();

  @override
  initState() {
    userId = userController.userId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFAFAFA),
        body: Column(
          children: [
            SizedBox(height: 171.h),
            const Center(
              child: Image(
                  image: AssetImage(
                      'assets/images/[Downloader.la]-622cc4d8a59d8 1.png')),
            ),
            SizedBox(height: 27.h),
            Padding(
              padding: EdgeInsets.only(left: 50.w, right: 50.w),
              child: CustomText(
                text: 'You’ve successfully submitted all your\nBio data, '
                    'verification would take 24 working days. '
                    'Pending Verification, you’re not qualified to receive loan',
                fontSize: 14,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 40.w, right: 40.w),
              child: customButton(
                title: 'Get Started',
                onPressed: () {
                  Get.offAll(() => const LoginPage());
                  print(userId);
                },
                fontSize: 16.0,
              ),
            )
          ],
        ));
  }
}
