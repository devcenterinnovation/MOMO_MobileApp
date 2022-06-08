import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momo/constants.dart';
import 'package:momo/custom_text.dart';
import 'package:momo/theme.dart';
import 'package:momo/views/loans/repayment.dart';
import 'package:momo/widgets/custom_clipper.dart';

class Loans extends StatefulWidget {
  const Loans({Key? key}) : super(key: key);

  @override
  State<Loans> createState() => _LoansState();
}

class _LoansState extends State<Loans> {
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
                    ClipPath(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        ClipOval(
                                          child: Container(
                                            height: 35.h,
                                            width: 35.w,
                                            decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/unsplash__cvwXhGqG-o.png'))),
                                          ),
                                        ),
                                        SizedBox(width: 6.w),
                                        CustomText(
                                          color: WHITE,
                                          text: 'Janet Richard',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.notifications_outlined,
                                      color: WHITE,
                                      size: 30.h,
                                    )
                                  ],
                                ),
                                SizedBox(height: 21.h),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 14.w, right: 14.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: 'Recent Loan',
                                        fontSize: 14,
                                        color: AppColors.grey4,
                                      ),
                                      Container(
                                        width: double.maxFinite,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 20.h,
                                                  left: 30.w,
                                                  right: 30.w,
                                                  bottom: 14.h),
                                              child: Row(
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
                                                              text: 'Total Due',
                                                              fontSize: 12,
                                                              color: AppColors
                                                                  .laon3,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                          SizedBox(height: 5.h),
                                                          CustomText(
                                                            text: 'N3200',
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
                                                              text:
                                                                  'Repayment Date',
                                                              fontSize: 12,
                                                              color: AppColors
                                                                  .laon3,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                          SizedBox(height: 5.h),
                                                          CustomText(
                                                            text: '28,02,2022',
                                                            fontSize: 16,
                                                            color: BLACK,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 14.w,
                                                  right: 14.w,
                                                  bottom: 20.h),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .report_problem_rounded,
                                                    color: AppColors.caution,
                                                    size: 25.h,
                                                  ),
                                                  SizedBox(width: 6.w),
                                                  Expanded(
                                                    child: CustomText(
                                                      text:
                                                          'Failure to pay off loan after due date would attract penalty as stated in the terms and conditions.',
                                                      fontSize: 10,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 80.h),
                              ],
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 57.w, right: 57.w),
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
                          onTap: () => Get.to(() => const Repayment()),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(16.h),
                              child: Text(
                                'Make Payment',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14.sp),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 31.w),
                  child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage('assets/images/Frame 62.png'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 18.h, bottom: 18.w, left: 21.w),
                      child: CustomText(
                        text: 'Gettting a Loan is made\neasy  with MOMO ',
                        color: WHITE,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25.h),
                Padding(
                  padding: EdgeInsets.only(left: 30.w, bottom: 10.h),
                  child: CustomText(
                    text: 'Payment Method',
                    color: AppColors.laon3,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 10.h, bottom: 14.h, left: 21.w),
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
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  CustomText(
                                    text: '0178273499',
                                    fontSize: 16,
                                    color: AppColors.mainColor,
                                  ),
                                  const SizedBox(width: 14),
                                  const Icon(
                                    Icons.content_copy_outlined,
                                    color: AppColors.mainColor,
                                    size: 20,
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
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
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
                      padding:
                          EdgeInsets.only(top: 10.h, bottom: 14.h, left: 20.w),
                      child: CustomText(
                        text: 'Repayment Guide',
                        fontSize: 16,
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32.h),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 30.w, right: 30.w, bottom: 12.h),
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
                          left: 40.w, right: 40.w, bottom: 30.h),
                      child: Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 33.w, right: 33.w, top: 15.h, bottom: 15.h),
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
