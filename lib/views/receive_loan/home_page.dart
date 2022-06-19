import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momo/constants.dart';
import 'package:momo/custom_text.dart';
import 'package:momo/theme.dart';
import 'package:momo/views/receive_loan/explore_loan_offer.dart';
import 'package:momo/widget.dart';
import 'package:momo/widgets/custom_clipper.dart';
import 'package:timelines/timelines.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int loans = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              color: AppColors.secondaryColor,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.2),
          SingleChildScrollView(
            child: Column(
              children: [
                ClipPath(
                  clipper: MyClipper(),
                  child: Stack(
                    children: [
                      Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 0.5,
                              blurRadius: 0.5,
                              offset: const Offset(
                                  0, 5), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: 77.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 30.w),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    CustomText(
                                      text: 'Hi janet',
                                      fontSize: 16,
                                      color: WHITE,
                                    ),
                                    SizedBox(height: 10.h),
                                    Row(
                                      children: [
                                        CustomText(
                                          text:
                                              'Loan up to\n500,000 with\nzero interest on\nyour first loan!!',
                                          color: WHITE,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        const Spacer(),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: 23.w, top: 45.h),
                                          child: SizedBox(
                                            height: 85.h,
                                            width: 102.w,
                                            child: Image.asset(
                                              'assets/images/image 6.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                    CustomText(
                                      text: 'From the Momo Credit loan app',
                                      fontSize: 12,
                                      color: WHITE,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 108.w,
                                  right: 108.w,
                                  top: 43.h,
                                  bottom: 27.h,
                                ),
                                child: customButton(
                                  onPressed: () {
                                    setState(
                                      () {
                                        loans += 1;
                                      },
                                    );
                                    Get.to(() => const ExploreLoanOffers());
                                  },
                                  title: 'Apply Now',
                                  color: Colors.transparent,
                                  textColor: WHITE,
                                  borderColor: WHITE,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    color: WHITE,
                    child: Column(
                      children: [
                        SizedBox(height: 22.h),
                        Padding(
                          padding: EdgeInsets.only(left: 45.w, right: 45.w),
                          child: Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                color: AppColors.lightGreen,
                                borderRadius: BorderRadius.circular(30)),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 30.w, top: 5.h, bottom: 5.h),
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
                                      text:
                                          'Earn bonus for paying ahead of due date',
                                      fontSize: 10,
                                      color: AppColors.laon3,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 30.w, right: 30.w, top: 10.h, bottom: 30.h),
                          child: Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.topRight,
                                  colors: [
                                    AppColors.lightGrey,
                                    AppColors.mainColor
                                  ],
                                )),
                            child: Padding(
                              padding:
                                  EdgeInsets.fromLTRB(40.w, 22.h, 40.w, 18.h),
                              child: Column(
                                children: [
                                  CustomText(
                                    text: 'Easy steps to take loan',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  SizedBox(height: 5.h),
                                  CustomText(
                                    text:
                                        'Getting a loan has never been easier,\n'
                                        'complete verification to receive loan',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  SizedBox(height: 36.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          DotIndicator(
                                            color: const Color(0xFF1E3B62),
                                            size: 10.h,
                                          ),
                                          CustomText(
                                            text: 'Apply',
                                            fontSize: 12,
                                            color: Color(0xFF1E3B62),
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          DotIndicator(
                                            color: AppColors.lightMainColor,
                                            size: 10.h,
                                          ),
                                          CustomText(
                                            text: 'Review',
                                            fontSize: 12,
                                            color: AppColors.lightMainColor,
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          DotIndicator(
                                            color: AppColors.lightMainColor,
                                            size: 10.h,
                                          ),
                                          CustomText(
                                            text: 'Approval',
                                            fontSize: 12,
                                            color: AppColors.lightMainColor,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 40.w,
                                      right: 40.w,
                                      top: 23.h,
                                    ),
                                    child: customButton(
                                      title: 'Request Loan',
                                      fontSize: 14.0,
                                      color: Colors.transparent,
                                      textColor: AppColors.grey3,
                                      borderColor: WHITE,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 30.w, right: 30.w, bottom: 12.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: 'Requests',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              CustomText(
                                text: 'see all',
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                color: AppColors.laon3,
                              )
                            ],
                          ),
                        ),
                        loans != 0
                            ? Padding(
                                padding:
                                    EdgeInsets.only(left: 40.w, right: 40.w),
                                child: Container(
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xFFF9C7C9),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        18.w, 16.h, 14.w, 14.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomText(
                                                text: '10 Mar’ 2022 : 10:12 AM',
                                                fontSize: 10),
                                            SizedBox(height: 5.h),
                                            CustomText(
                                                text: '100,000',
                                                fontWeight: FontWeight.w600),
                                            CustomText(
                                              text: 'Education Loan',
                                              fontSize: 10,
                                            )
                                          ],
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: const Color(0xFFDBB994),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 12.w,
                                                vertical: 5.h),
                                            child: CustomText(
                                              text: 'READY TO DISBURSE',
                                              fontSize: 10,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : Padding(
                                padding:
                                    EdgeInsets.only(left: 40.w, right: 40.w),
                                child: Container(
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: WHITE,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                        offset: const Offset(
                                            0, 5), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Image.asset('assets/images/image 19.png'),
                                      CustomText(
                                        text: 'No active loans',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                      CustomText(
                                        text: 'You haven’t taken any loans yet',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                      SizedBox(height: 24.h),
                                    ],
                                  ),
                                ),
                              ),
                        SizedBox(height: 24.h),
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
