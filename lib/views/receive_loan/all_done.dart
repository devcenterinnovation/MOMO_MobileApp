import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momo/constants.dart';
import 'package:momo/custom_text.dart';
import 'package:momo/views/user_profile/refer_a_friend.dart';
import 'package:momo/widget.dart';
import 'package:momo/widgets/bottom_menu_nav.dart';

class AllDone extends StatelessWidget {
  const AllDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 45.w,
              right: 45.w,
              top: 60.h,
            ),
            child: Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: AppColors.lightGreen,
                  borderRadius: BorderRadius.circular(30)),
              child: Padding(
                padding: EdgeInsets.only(left: 30.w, top: 5.h, bottom: 5.h),
                child: Row(
                  children: [
                    SizedBox(
                        height: 25.h,
                        width: 25.w,
                        child: Image.asset(
                            'assets/images/noto-v1_wrapped-gift.png')),
                    Padding(
                      padding: EdgeInsets.only(left: 9.0.h),
                      child: CustomText(
                        text: 'Earn bonus for paying ahead of due date',
                        fontSize: 10,
                        color: AppColors.laon3,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 32.h),
              SizedBox(
                height: 339.h,
                width: 230.w,
                child: Image.asset('assets/images/image 23normal.png'),
              ),
              SizedBox(height: 8.h),
              CustomText(
                text: 'All done',
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
              SizedBox(height: 4.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 42.0),
                child: CustomText(
                  text:
                      'Your loan request was sent out successfully, and will be disbursed in a few minutes',
                  textAlign: TextAlign.center,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0.w),
                child: customButton(title: 'Refer and Earn', onPressed: () => Get.to(() => const ReferFriend())),
              ),
              SizedBox(height: 10.h),
              GestureDetector(
                onTap: () => Get.offAll(() => const HomeNavigationBar()),
                child: CustomText(
                  text: 'Go back home',
                  fontSize: 12,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
