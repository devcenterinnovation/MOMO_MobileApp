import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momo/constants.dart';
import 'package:momo/custom_text.dart';
import 'package:momo/theme.dart';
import 'package:momo/views/wallets/upcoming_payment.dart';
import 'package:momo/widgets/custom_clipper.dart';

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
                          child: Image.asset('assets/images/momo_cartoon.png'),
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
                                            horizontal: 21.w, vertical: 10.h),
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
                SizedBox(height: 25.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(30.w, 17.h, 30.w, 23.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  linearDot,
                                  const SizedBox(width: 10),
                                  CustomText(
                                      text: 'Credit Virtual account',
                                      color: WHITE)
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 21.w),
                                child: CustomText(
                                  text: 'Loan is repaid successfully',
                                  color: WHITE,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 47.h,
                            width: 47.w,
                            child: Image.asset('assets/images/image 13.png'),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
