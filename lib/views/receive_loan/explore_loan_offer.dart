import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momo/constants.dart';
import 'package:momo/custom_text.dart';
import 'package:momo/theme.dart';
import 'package:momo/views/receive_loan/request_specific_amount.dart';

class ExploreLoanOffers extends StatelessWidget {
  const ExploreLoanOffers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double loan = 0;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.mainColor,
        child: const Icon(
          Icons.message_outlined,
          size: 30,
        ),
        onPressed: () {},
      ),
      appBar: AppBar(
        backgroundColor: WHITE,
        elevation: 0,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back,
            color: BLACK,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 27.w),
            child: Align(
              alignment: Alignment.bottomRight,
              child: CustomText(
                text: 'View past transaction',
                color: AppColors.buyyyon,
                fontSize: 10,
                textDecoration: TextDecoration.underline,
                underlineColor: AppColors.buyyyon,
              ),
            ),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: EdgeInsets.fromLTRB(13.w, 19.h, 0, 19.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomText(
                      text: 'Explore Loan Offers',
                      color: WHITE,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    CustomText(
                      text: 'Based on your profile,'
                          'you are eligible\nfor the following loan amount',
                      fontSize: 12,
                      color: WHITE,
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 26.h),
          GestureDetector(
            onTap: () {
              loan = 7000;
              Get.to(() => RequestSpecificAmount(amount: loan));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 34.w),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF9C7C9),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 0.5,
                      blurRadius: 0.5,
                      offset: const Offset(0, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 19.h, horizontal: 30.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'NGN 7,000',
                        color: BLACK,
                      ),
                      CustomText(
                        text: 'Request',
                        fontSize: 12,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          GestureDetector(
            onTap: () {
              loan = 4500;
              Get.to(() => RequestSpecificAmount(amount: loan));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 34.w),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F5F5),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 0.5,
                      blurRadius: 0.5,
                      offset: const Offset(0, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 19.h, horizontal: 30.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'NGN 4,500',
                        color: BLACK,
                      ),
                      CustomText(
                        text: 'Request',
                        fontSize: 12,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          GestureDetector(
            onTap: () {
              loan = 3000;
              Get.to(() => RequestSpecificAmount(amount: loan));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 34.w),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F5F5),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 0.5,
                      blurRadius: 0.5,
                      offset: const Offset(0, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 19.h, horizontal: 30.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'NGN 3,000',
                        color: BLACK,
                      ),
                      CustomText(
                        text: 'Request',
                        fontSize: 12,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(left: 34.w),
              child: CustomText(
                text: 'Want a different amount?',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF1E3B62),
              ),
            ),
          ),
          SizedBox(height: 42.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: [AppColors.lightGrey, AppColors.mainColor],
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(24.w, 23.h, 0, 35.h),
                    child: Column(
                      children: [
                        CustomText(
                          text: 'Interest Breakdown',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        CustomText(
                          text:
                              'Everything you need to\nknow about Momo’s\ninterest policy',
                          fontSize: 12,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 118.h,
                      width: 168.w,
                      child: Image.asset('assets/images/[Downloader 1.png'),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
