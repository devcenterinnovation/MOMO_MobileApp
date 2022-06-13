import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momo/constants.dart';
import 'package:momo/custom_text.dart';
import 'package:momo/theme.dart';
import 'package:momo/views/receive_loan/all_done.dart';
import 'package:momo/widget.dart';
import 'package:momo/widgets/small_dot.dart';

class SubmitRequest extends StatelessWidget {
  const SubmitRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            padding: EdgeInsets.only(left: 45.w, right: 45.w),
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
          SizedBox(height: 38.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: const Color(0xFFF8F3F3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 0.5,
                      blurRadius: 0.5,
                      offset: const Offset(0, 5), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: EdgeInsets.fromLTRB(22.w, 24.h, 22.w, 28.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomText(
                          text: 'Education Loan',
                          fontSize: 10,
                        ),
                        const Spacer(),
                        CustomText(
                          text: 'Repayment plan',
                          fontSize: 12,
                        ),
                        const Icon(Icons.keyboard_arrow_down_rounded)
                      ],
                    ),
                    SizedBox(height: 2.h),
                    CustomText(
                      text: '3,000',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(height: 4.h),
                    CustomText(
                      text: '10 Mar’ 2022 : 10:12 AM',
                      fontSize: 10,
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 46.h),
          Padding(
            padding: EdgeInsets.only(left: 30.w),
            child: CustomText(
              text: 'Momo’s guarantees',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.w),
            child: Row(
              children: [
                const SmallDot(),
                SizedBox(width: 10.w),
                Expanded(
                  child: CustomText(
                    text:
                        'Loan is automatically collected through bank account on the due day',
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.w),
            child: Row(
              children: [
                const SmallDot(),
                SizedBox(width: 10.w),
                Expanded(
                  child: CustomText(
                    text:
                        'Failure to stick to the repayment date would lead to disabled account',
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.w),
            child: Row(
              children: [
                const SmallDot(),
                SizedBox(width: 10.w),
                Expanded(
                  child: CustomText(
                    text: 'Before loan payment, processing takes 3 days',
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 40.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: customButton(
                title: 'Submit Request',
                fontSize: 16.0,
                onPressed: () => Get.to(() => const AllDone())),
          )
        ],
      ),
    );
  }
}
