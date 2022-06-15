import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momo/constants.dart';
import 'package:momo/custom_text.dart';
import 'package:momo/theme.dart';
import 'package:momo/views/wallets/upcoming_payment.dart';
import 'package:momo/widgets/custom_clipper.dart';
import 'package:timelines/timelines.dart';

class Wallets extends StatefulWidget {
  const Wallets({Key? key}) : super(key: key);

  @override
  State<Wallets> createState() => _WalletsState();
}

class _WalletsState extends State<Wallets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5).withOpacity(0.2),
      body: Stack(
        children: [
          Container(
              color: AppColors.secondaryColor,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.2),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 25.0.h),
                      child: ClipPath(
                        clipper: MyClipper(),
                        child: Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              color: AppColors.mainColor,
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
                              padding: EdgeInsets.only(
                                  left: 30.w, top: 72.h, right: 30.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 35.h,
                                        width: 35.h,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/unsplash__cvwXhGqG-o.png'))),
                                      ),
                                      SizedBox(width: 6.h),
                                      Expanded(
                                        child: CustomText(
                                          color: WHITE,
                                          text: 'Janet Richard',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 17.h),
                                  Container(
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                        color: WHITE,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 14.0.h, horizontal: 26.w),
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      CustomText(
                                                          text: 'Loan Applied',
                                                          fontSize: 12,
                                                          color:
                                                              AppColors.laon3,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      SizedBox(height: 5.h),
                                                      CustomText(
                                                        text: 'N3000',
                                                        fontSize: 20,
                                                        color: BLACK,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      CustomText(
                                                          text: 'Loan Period',
                                                          fontSize: 12,
                                                          color:
                                                              AppColors.laon3,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      SizedBox(height: 5.h),
                                                      CustomText(
                                                        text: '0 - 7 days',
                                                        fontSize: 16,
                                                        color: BLACK,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 30.h),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      CustomText(
                                                          text: 'Loan Received',
                                                          fontSize: 12,
                                                          color:
                                                              AppColors.laon3,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      SizedBox(height: 5.h),
                                                      CustomText(
                                                        text: 'N2940',
                                                        fontSize: 16,
                                                        color: BLACK,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      CustomText(
                                                          text:
                                                              'Repayment Amount',
                                                          fontSize: 12,
                                                          color:
                                                              AppColors.laon3,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      SizedBox(height: 5.h),
                                                      CustomText(
                                                        text: 'N3000',
                                                        fontSize: 16,
                                                        color: BLACK,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 60.h),
                                ],
                              ),
                            )),
                      ),
                    ),
                    Positioned(
                      bottom: 10.h,
                      right: 50.w,
                      left: 50.w,
                      child: Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                AppColors.lightGrey,
                                AppColors.mainColor
                              ],
                            )),
                        child: GestureDetector(
                          onTap: () => Get.to(() => const UpcomingPayment()),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(
                                  16.0.w, 16.0.h, 16.0.w, 16.0.h),
                              child: CustomText(
                                text: 'Make Payment',
                                color: WHITE,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                Padding(
                  padding: EdgeInsets.only(left: 30.0.w, bottom: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Repayment guide',
                        color: BLACK,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      CustomText(
                        text: 'Steps to make repayment',
                        color: AppColors.laon3,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      )
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.only(top: 100.h),
                        child: SizedBox(
                          height: 77.h,
                          width: 130.w,
                          child: Image.asset(
                              'assets/images/momo-removebg-preview 1.png'),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                        child: Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  const Color(0xFFEFF6FE),
                                  const Color(0xFFECF5FF).withOpacity(0.5),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(33.w, 20.h, 0, 27.h),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    linearDot,
                                    SizedBox(width: 10.w),
                                    CustomText(
                                      text:
                                          'Copy the momo virtual account number',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                    )
                                  ],
                                ),
                                SizedBox(height: 15.h),
                                Row(
                                  children: [
                                    linearDot,
                                    SizedBox(width: 10.w),
                                    CustomText(
                                      text:
                                          'Head on to a  designated payment portal',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                    )
                                  ],
                                ),
                                SizedBox(height: 20.h),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: const LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Color(0xFFDADADA),
                                            AppColors.mainColor,
                                          ],
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12.w, vertical: 10.h),
                                        child: CustomText(
                                          text: 'Pay with Bank App',
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                          color: WHITE,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 20.w),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: const LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Color(0xFFDADADA),
                                            AppColors.mainColor,
                                          ],
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12.w, vertical: 10.h),
                                        child: CustomText(
                                          text: 'Pay Via USSD',
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                          color: WHITE,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                  child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(
                                0, 4), // changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, bottom: 14.0, left: 20.0),
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15.0),
                                    topRight: Radius.circular(15.0)),
                              ),
                              backgroundColor: Color(0xFF4B6D9B),
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
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: WHITE, width: 1.0)),
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
                                        text: 'Repayment Guide',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: WHITE,
                                      ),
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 21.h),
                                        child: SizedBox(
                                          height: 67.h,
                                          width: 67.w,
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
                                          text:
                                              'Repaying your loan is made easy!\nSimply copy the momo virtual account number,'
                                              'head on to  a designated payment portal to credit the virtual account',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              });
                        },
                        child: CustomText(
                          text: 'Repayment Guide',
                          fontSize: 16,
                          color: AppColors.mainColor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 30.0.w, right: 30.0.w, bottom: 9.0.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'History',
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
                    Padding(
                      padding: EdgeInsets.only(
                          left: 40.0.w, right: 40.0.w, bottom: 30.h),
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
          )
        ],
      ),
    );
  }
}
