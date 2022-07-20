import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momo/constants.dart';
import 'package:momo/controllers/user_controller.dart';
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
  String name = '';
  String userId = '';

  UserController userController = Get.find();

  @override
  initState() {
    name = userController.getProfile()!.firstName;
    userId = userController.userId;
    super.initState();
  }

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
                        margin: EdgeInsets.only(top: 77.h),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 30.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  CustomText(
                                    text: 'Hi $name',
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
                                      Expanded(
                                        flex: 1,
                                        child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                right: 15.w, top: 45.h),
                                            height: 100.h,
                                            width: 140.w,
                                            child: Image.asset(
                                              'assets/images/image 6.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.h),
                                  CustomText(
                                    text: 'From the Momo Credit app',
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
                                    () {},
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
                    ],
                  ),
                ),
                Container(
                    color: WHITE,
                    child: Column(
                      children: [
                        SizedBox(height: 22.h),
                        Container(
                          margin: EdgeInsets.only(left: 45.w, right: 45.w),
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: AppColors.lightGreen,
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 20.w, top: 5.h, bottom: 5.h),
                            child: Row(
                              children: [
                                SizedBox(
                                    height: 25.h,
                                    width: 25.w,
                                    child: Image.asset(
                                        'assets/images/noto-v1_wrapped-gift.png')),
                                SizedBox(width: 10.w),
                                Expanded(
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
                                        'Getting a loan has never been easier,'
                                        ' complete verification to receive loan',
                                    fontSize: 14,
                                    color: Colors.black.withOpacity(0.8),
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
                                            color: const Color(0xFF1E3B62),
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
