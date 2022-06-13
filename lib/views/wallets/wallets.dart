import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                                        color: AppColors.lightMainColor,
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
                                                          color: AppColors
                                                              .Tertiary,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      SizedBox(height: 5.h),
                                                      CustomText(
                                                        text: 'N3000',
                                                        fontSize: 20,
                                                        color: WHITE,
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
                                                          color: WHITE,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      SizedBox(height: 5.h),
                                                      CustomText(
                                                        text: '0 - 7 days',
                                                        fontSize: 16,
                                                        color: WHITE,
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
                                                          color: AppColors
                                                              .Tertiary,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      SizedBox(height: 5.h),
                                                      CustomText(
                                                        text: 'N2940',
                                                        fontSize: 16,
                                                        color: WHITE,
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
                                                          color: WHITE,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      SizedBox(height: 5.h),
                                                      CustomText(
                                                        text: 'N3000',
                                                        fontSize: 16,
                                                        color: WHITE,
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
                              end: Alignment.topRight,
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
                SizedBox(height: 5.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                  child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage('assets/images/Frame 62.png'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 18.0.h, bottom: 18.0.h, left: 21.w),
                      child: CustomText(
                        text: 'Getting a Loan is made\neasy  with MOMO ',
                        color: WHITE,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Padding(
                  padding: EdgeInsets.only(left: 30.0.w, bottom: 10.h),
                  child: CustomText(
                    text: 'Payment Method',
                    color: AppColors.laon3,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                  child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 10.0.h, bottom: 14.0.h, left: 21.0.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: 'Pay with virtual card',
                                color: AppColors.mainColor,
                                fontSize: 10,
                              ),
                              CustomText(
                                text: 'Repayment Account Number',
                                fontSize: 16,
                                color: AppColors.mainColor,
                              ),
                              SizedBox(height: 8.h),
                              Row(
                                children: [
                                  CustomText(
                                    text: '0178273499',
                                    fontSize: 16,
                                    color: AppColors.mainColor,
                                  ),
                                  SizedBox(width: 14.w),
                                  InkWell(
                                    onTap: () {
                                      Clipboard.setData(const ClipboardData(
                                              text: '0178273499'))
                                          .then((_) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content:
                                                    Text("Account Copied!")));
                                      });
                                    },
                                    child: Icon(
                                      Icons.content_copy_outlined,
                                      color: AppColors.mainColor,
                                      size: 20.sp,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Expanded(
                              child: Image.asset('assets/images/image 13.png')),
                          SizedBox(width: 5.w)
                        ],
                      ),
                    ),
                  ),
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
