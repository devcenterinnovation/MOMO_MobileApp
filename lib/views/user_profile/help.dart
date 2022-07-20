import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:momo/constants.dart';
import 'package:momo/custom_text.dart';
import 'package:momo/theme.dart';

class Help extends StatelessWidget {
  const Help({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const email = "Contactmomo@gmail.com";
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFAFA),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Center(
          child: SizedBox(
              height: 68.h,
              width: 69.w,
              child: Image.asset('assets/images/Momo logo 1.png')),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5.h),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: const Icon(Icons.arrow_back_rounded),
                ),
                SizedBox(height: 33.h),
                CustomText(
                  text: 'Hi, how can we help you today?',
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 20.h),
                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFF5F5F5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(21.w, 16.h, 17.w, 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(text: 'Check FAQs'),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 20,
                            )
                          ],
                        ),
                        CustomText(
                          text: 'Read through answered questions',
                          color: AppColors.laon3,
                          fontSize: 14,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFF5F5F5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(21.h, 16.h, 17.h, 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(text: 'Send Feedback'),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 20,
                            )
                          ],
                        ),
                        CustomText(
                          text: 'Send a message to fix account challenge',
                          color: AppColors.laon3,
                          fontSize: 14,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 43.h),
                Stack(
                  children: [
                    Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFF1F7FE),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 4,
                            blurRadius: 4,
                            offset: const Offset(
                                0, 20), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20.w, 72.h, 20.w, 72.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(text: 'Contact Us'),
                            SizedBox(height: 5.h),
                            CustomText(
                              text:
                                  'You can reach us via email,\nand social media profiles.',
                              fontSize: 12,
                            ),
                            SizedBox(height: 10.h),
                            Container(
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: WHITE),
                              child: Padding(
                                padding:
                                    EdgeInsets.fromLTRB(30.w, 12.h, 0.w, 12.h),
                                child: Row(
                                  children: [
                                    CustomText(
                                      text: email,
                                      fontSize: 14,
                                    ),
                                    SizedBox(width: 20.0.w),
                                    InkWell(
                                      onTap: () {
                                        Clipboard.setData(const ClipboardData(
                                                text: email))
                                            .then((_) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content:
                                                      Text("Email Copied!")));
                                        });
                                      },
                                      child: SvgPicture.asset(
                                          'assets/images/Groupcopy.svg'),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        right: -20,
                        top: -16,
                        child: Image.asset(
                          'assets/images/image 16.png',
                          height: 147.h,
                          width: 144.w,
                        ))
                  ],
                ),
                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
