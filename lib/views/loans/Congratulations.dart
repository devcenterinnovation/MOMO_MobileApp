import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momo/custom_text.dart';
import 'package:momo/widget.dart';
import 'package:momo/widgets/bottom_menu_nav.dart';

class Congratulations extends StatelessWidget {
  const Congratulations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 60),
          SizedBox(
            height: 339.h,
            width: 230.w,
            child: Image.asset('assets/images/image 23normal.png'),
          ),
          const SizedBox(height: 18),
          CustomText(
            text: 'Congratulations',
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          const SizedBox(height: 5),
          CustomText(
            text: 'You’ve successfully paid off your loan',
            fontSize: 14,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: customButton(title: 'Refer and Earn'),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () => Get.to(() => const HomeNavigationBar()),
            child: CustomText(
              text: 'Go back home',
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
