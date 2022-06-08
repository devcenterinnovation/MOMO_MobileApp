import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momo/constants.dart';
import 'package:momo/custom_text.dart';
import 'package:momo/input_field.dart';
import 'package:momo/theme.dart';
import 'package:momo/views/receive_loan/submit_request.dart';
import 'package:momo/widget.dart';
import 'package:momo/widgets/custom_clipper.dart';

class RequestSpecificAmount extends StatefulWidget {
  const RequestSpecificAmount({Key? key}) : super(key: key);

  @override
  State<RequestSpecificAmount> createState() => _RequestSpecificAmountState();
}

class _RequestSpecificAmountState extends State<RequestSpecificAmount> {
  double _currentValue = 0;
  double _days = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: WHITE,
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back,
          color: BLACK,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30.w, bottom: 27.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Request a specific amount',
                    fontWeight: FontWeight.w600,
                  ),
                  CustomText(
                    text: 'How much do you want to borrow and\nfor how long',
                    color: AppColors.secondary,
                    fontSize: 12,
                  )
                ],
              ),
            ),
            Slider(
                value: _currentValue,
                min: 0,
                max: 50000,
                label: "N" + _currentValue.toString(),
                divisions: 10,
                activeColor: AppColors.mainColor,
                onChanged: (value) {
                  setState(() {
                    _currentValue = value;
                  });
                }),
            SizedBox(height: 30.h),
            Slider(
                value: _days,
                min: 0,
                max: 14,
                label: _days.toString() + " days",
                divisions: 14,
                activeColor: AppColors.mainColor,
                onChanged: (value) {
                  setState(() {
                    _days = value;
                  });
                }),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: ClipPath(
                clipper: SmallClipper(),
                child: Container(
                  width: double.maxFinite,
                  decoration: const BoxDecoration(color: AppColors.captions),
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 20.h, bottom: 20.h, left: 33.w),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: SizedBox(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                        text: 'Loan Amount',
                                        fontSize: 10,
                                        color: const Color(0xFFA47B7D),
                                        fontWeight: FontWeight.w400),
                                    SizedBox(height: 5.h),
                                    CustomText(
                                      text: 'N3,000',
                                      fontSize: 12,
                                      color: BLACK,
                                      fontWeight: FontWeight.w500,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                        text: 'Duration',
                                        fontSize: 10,
                                        color: const Color(0xFFA47B7D),
                                        fontWeight: FontWeight.w400),
                                    SizedBox(height: 5.h),
                                    CustomText(
                                      text: '7 days',
                                      fontSize: 12,
                                      color: BLACK,
                                      fontWeight: FontWeight.w500,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 12.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: SizedBox(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                        text: 'Service charge',
                                        fontSize: 10,
                                        color: const Color(0xFFA47B7D),
                                        fontWeight: FontWeight.w400),
                                    SizedBox(height: 5.h),
                                    CustomText(
                                      text: 'N60 (15%)',
                                      fontSize: 12,
                                      color: BLACK,
                                      fontWeight: FontWeight.w500,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                        text: 'Vat',
                                        fontSize: 10,
                                        color: const Color(0xFFA47B7D),
                                        fontWeight: FontWeight.w400),
                                    SizedBox(height: 5.h),
                                    CustomText(
                                      text: 'N120 (10%)',
                                      fontSize: 12,
                                      color: BLACK,
                                      fontWeight: FontWeight.w500,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 12.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: SizedBox(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                        text: 'Amount to be paid',
                                        fontSize: 10,
                                        color: const Color(0xFFA47B7D),
                                        fontWeight: FontWeight.w400),
                                    SizedBox(height: 5.h),
                                    CustomText(
                                      text: 'N2,250',
                                      fontSize: 12,
                                      color: BLACK,
                                      fontWeight: FontWeight.w500,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                        text: 'Total Due',
                                        fontSize: 10,
                                        color: const Color(0xFFA47B7D),
                                        fontWeight: FontWeight.w400),
                                    SizedBox(height: 5.h),
                                    CustomText(
                                      text: 'N3,000',
                                      fontSize: 12,
                                      color: BLACK,
                                      fontWeight: FontWeight.w500,
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
              ),
            ),
            SizedBox(height: 35.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Purpose of Loan',
                    fontSize: 14,
                  ),
                  const InputFormField(
                    label: 'Education',
                    suffixIcon: Icon(Icons.keyboard_arrow_down_rounded),
                  ),
                  SizedBox(height: 12.h),
                  CustomText(
                    text: 'Bank Account Informtion',
                    fontSize: 14,
                  ),
                  const InputFormField(
                    label: 'GT Bank  - 0127338292',
                  ),
                  SizedBox(height: 12.h),
                  CustomText(
                    text: 'Repayment Plan',
                    fontSize: 14,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: InputFormField(
                          label: 'N3,000',
                          suffixIcon: Icon(Icons.keyboard_arrow_down_rounded),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      const Expanded(
                          child: InputFormField(
                        label: '7 days',
                        suffixIcon: Icon(Icons.keyboard_arrow_down_rounded),
                      ))
                    ],
                  ),
                  CustomText(
                    text: 'View Calculations',
                    color: AppColors.laon3,
                    fontSize: 10,
                  ),
                  SizedBox(height: 25.h),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: customButton(
                  title: 'Next',
                  onPressed: () => Get.to(() => const SubmitRequest())),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
