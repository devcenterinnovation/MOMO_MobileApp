import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momo/constants.dart';
import 'package:momo/custom_text.dart';
import 'package:momo/theme.dart';

class UpcomingPayment extends StatefulWidget {
  const UpcomingPayment({Key? key}) : super(key: key);

  @override
  State<UpcomingPayment> createState() => _UpcomingPaymentState();
}

class _UpcomingPaymentState extends State<UpcomingPayment> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: InkWell(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.chevron_left,
              color: BLACK,
              size: 30,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: const Icon(
              Icons.notifications_none_rounded,
              color: BLACK,
              size: 30,
            ),
          )
        ],
        elevation: 0,
        backgroundColor: WHITE,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('assets/images/Rectangle 101.png'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(22.w, 27, 38, 24),
                  child: CustomText(
                    text: 'The repayment amount can be changed, '
                        'the\nminimum is N1000. Loan repayment'
                        ' can also be done\nahead of the due date. '
                        'Paying ahead increases\nyour chance of qualifying for '
                        'longer loan duration.',
                    fontSize: 11,
                    color: WHITE,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: AppColors.lightGreen,
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0, top: 5, bottom: 5),
                  child: Row(
                    children: [
                      SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset(
                              'assets/images/noto-v1_wrapped-gift.png')),
                      Padding(
                        padding: const EdgeInsets.only(left: 9.0),
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
              SizedBox(height: 30.h),
              CustomText(
                  text: 'Repayment Amount',
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
              SizedBox(height: 30.h),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 23.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomText(
                            text: 'Repayment Amount',
                            fontSize: 10,
                          ),
                        ),
                        Expanded(
                          child: CustomText(
                            text: 'N3,000',
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    color: AppColors.Tertiary,
                    thickness: 0.5,
                  ),
                  SizedBox(height: 5.h),
                  Padding(
                    padding: EdgeInsets.only(left: 23.w, bottom: 3.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomText(
                            text: 'Repayment balance',
                            fontSize: 10,
                          ),
                        ),
                        Expanded(
                          child: CustomText(
                            text: 'N0',
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    color: AppColors.Tertiary,
                    thickness: 0.5,
                  ),
                  SizedBox(height: 5.h),
                  Padding(
                    padding: EdgeInsets.only(left: 23.w, bottom: 3.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomText(
                            text: 'Amount repaid',
                            fontSize: 10,
                          ),
                        ),
                        Expanded(
                          child: CustomText(
                            text: 'N0',
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    color: AppColors.Tertiary,
                    thickness: 0.5,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 23.w, top: 3.h, bottom: 35.h),
                    child: Row(
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: CustomText(
                            text: 'Your loan payment is due on ',
                            fontSize: 10,
                            color: AppColors.laon3,
                          ),
                        ),
                        CustomText(
                          text: '26, June',
                          fontSize: 14,
                          color: AppColors.mainColor,
                          fontWeight: FontWeight.w600,
                        )
                      ],
                    ),
                  )
                ],
              ),
              CustomText(
                text: 'Repayment Method',
                color: AppColors.laon3,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 14.h),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(14.w, 20.h, 5.w, 30.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'Repayment Account Number',
                            fontSize: 16,
                            color: WHITE,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              CustomText(
                                text: '0178273499',
                                fontSize: 16,
                                color: WHITE,
                              ),
                              const SizedBox(width: 14),
                              InkWell(
                                  onTap: () {
                                    Clipboard.setData(const ClipboardData(
                                        text: '3119307387'));
                                    showModalBottomSheet(
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15.0),
                                              topRight: Radius.circular(15.0)),
                                        ),
                                        backgroundColor:
                                            const Color(0xFF4B6D9B),
                                        context: context,
                                        builder: (context) {
                                          return Wrap(
                                            children: [
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 23.h, right: 30.w),
                                                  child: InkWell(
                                                    onTap: () => Get.back(),
                                                    child: Container(
                                                      height: 25.h,
                                                      width: 25.w,
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                              color: WHITE,
                                                              width: 1.0)),
                                                      child: Icon(
                                                        Icons.close,
                                                        size: 20.h,
                                                        color: WHITE,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Center(
                                                child: CustomText(
                                                  text:
                                                      'Pay off loan with virtual account',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                  color: WHITE,
                                                ),
                                              ),
                                              Center(
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 21.h),
                                                  child: SizedBox(
                                                    height: 90.h,
                                                    width: 90.w,
                                                    child: Image.asset(
                                                        'assets/images/image 13.png'),
                                                  ),
                                                ),
                                              ),
                                              Center(
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 5.h,
                                                      left: 35.w,
                                                      right: 35.w,
                                                      bottom: 75.h),
                                                  child: CustomText(
                                                    color: WHITE,
                                                    textAlign: TextAlign.center,
                                                    text: 'Account copied!',
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              )
                                            ],
                                          );
                                        });
                                  },
                                  child: const Icon(
                                    Icons.content_copy_outlined,
                                    color: WHITE,
                                    size: 20,
                                  ))
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 71.h,
                        width: 71.w,
                        child: Image.asset('assets/images/image 13.png'),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: 15.0.h, top: 30.h, left: 3.w, right: 3.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'Loan History',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        CustomText(
                          text: 'see all',
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: AppColors.grey4,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 30.h),
                    child: Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 33.0.w,
                            right: 33.0.w,
                            top: 15.0.h,
                            bottom: 15.0.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: 'Educational loan',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                                CustomText(
                                  text: '3000,000',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ],
                            ),
                            CustomText(
                              text: 'View details',
                              color: AppColors.laon3,
                              fontSize: 12,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
