import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:momo/constants.dart';
import 'package:momo/controllers/user_controller.dart';
import 'package:momo/custom_text.dart';
import 'package:momo/dialogs_snackbar.dart';
import 'package:momo/services/internet_services.dart';
import 'package:momo/theme.dart';
import 'package:momo/views/receive_loan/all_done.dart';
import 'package:momo/widget.dart';
import 'package:momo/widgets/small_dot.dart';

import '../../services/loan_services.dart';

class SubmitRequest extends StatefulWidget {
  final String purpose;
  final int loanAmount;
  final int days;
  final double serviceCharge;
  final int totalDue;
  final double disburseAmount;

  const SubmitRequest(
      {Key? key,
      required this.purpose,
      required this.loanAmount,
      required this.days,
      required this.serviceCharge,
      required this.totalDue,
      required this.disburseAmount})
      : super(key: key);

  @override
  State<SubmitRequest> createState() => _SubmitRequestState();
}

class _SubmitRequestState extends State<SubmitRequest> {
  NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
  String userId = '';
  String token = '';
  UserController userController = Get.find();

  @override
  initState() {
    userId = userController.userId;
    token = userController.getToken()!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    String formatter = DateFormat.yMMMMd('en_US').add_jm().format(now);
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
                          text: '${widget.purpose} Loan',
                          fontSize: 10,
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15.0),
                                      topRight: Radius.circular(15.0)),
                                ),
                                backgroundColor: const Color(0xFF4B6D9B),
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
                                        text: 'Loan Details',
                                        fontWeight: FontWeight.w500,
                                        color: WHITE,
                                      )),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 40.h,
                                            bottom: 80.h,
                                            left: 41.w),
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
                                                            text: 'Loan Amount',
                                                            fontSize: 12,
                                                            color: const Color(
                                                                0xFFF7F1F2),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                        SizedBox(height: 5.h),
                                                        CustomText(
                                                          text:
                                                              'N${myFormat.format(widget.loanAmount)}',
                                                          fontSize: 16,
                                                          color: WHITE,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 80.w),
                                                Expanded(
                                                  child: SizedBox(
                                                    width: double.infinity,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        CustomText(
                                                            text: 'Duration',
                                                            fontSize: 12,
                                                            color: const Color(
                                                                0xFFF7F1F2),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                        SizedBox(height: 5.h),
                                                        CustomText(
                                                          text:
                                                              '${widget.days} days',
                                                          fontSize: 16,
                                                          color: WHITE,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 12.h),
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
                                                            text:
                                                                'Service charge',
                                                            fontSize: 12,
                                                            color: const Color(
                                                                0xFFF7F1F2),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                        SizedBox(height: 5.h),
                                                        CustomText(
                                                          text:
                                                              'N${myFormat.format(widget.serviceCharge)}',
                                                          fontSize: 16,
                                                          color: WHITE,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 80.w),
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
                                                            color: const Color(
                                                                0xFFF7F1F2),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                        SizedBox(height: 5.h),
                                                        CustomText(
                                                          text:
                                                              'N${myFormat.format(widget.totalDue)}',
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
                                            SizedBox(height: 12.h),
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
                                                            text:
                                                                'Disburse Amount',
                                                            fontSize: 12,
                                                            color: const Color(
                                                                0xFFF7F1F2),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                        SizedBox(height: 5.h),
                                                        CustomText(
                                                          text:
                                                              'N${myFormat.format(widget.disburseAmount)}',
                                                          fontSize: 16,
                                                          color: WHITE,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                });
                          },
                          child: CustomText(
                            text: 'Repayment plan',
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    CustomText(
                      text: 'N ${myFormat.format(widget.loanAmount)}',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(height: 4.h),
                    CustomText(
                      text: formatter,
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
              text: 'Momo Credit guarantees',
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
                onPressed: () {
                  _submit(context);
                }),
          )
        ],
      ),
    );
  }

  void _submit(context) async {
    if (await InternetUtils.checkConnectivity()) {
      loadingDialog(context);

      var response = await LoanServices.userLoan(userController.getToken()!,
          amount: widget.loanAmount, purpose: widget.purpose, userId: userId);

      if (response is String) {
        showErrorSnackBar(
            'Error!', 'Failed to apply for loan, please try again');
      } else {
        Get.offAll(() => const AllDone());
      }
    }
  }
}
