import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:momo/constants.dart';
import 'package:momo/controllers/user_controller.dart';
import 'package:momo/custom_text.dart';
import 'package:momo/dialogs_snackbar.dart';
import 'package:momo/models/user_model.dart';
import 'package:momo/services/loan_services.dart';
import 'package:momo/theme.dart';
import 'package:momo/views/receive_loan/request_specific_amount.dart';
import 'package:momo/widget.dart';

class ExploreLoanOffers extends StatefulWidget {
  const ExploreLoanOffers({Key? key}) : super(key: key);

  @override
  State<ExploreLoanOffers> createState() => _ExploreLoanOffersState();
}

class _ExploreLoanOffersState extends State<ExploreLoanOffers> {
  NumberFormat myFormat = NumberFormat.decimalPattern('en_us');

  String maxBalance = '';
  String token = '';
  String userId = '';
  UserController userController = Get.find();

  List<Loan> loans = [];

  Future<void> getUserLoans() async {
    var res = await LoanServices.getLoans(token, userId);
    final res2 = jsonEncode(res);
    if (res2.isNotEmpty) {
      final result = userFromJson(res2);
      loans = result.loans;
      setState(() {});
    } else {}
  }

  @override
  initState() {
    userId = userController.userId;
    token = userController.getToken()!;
    maxBalance = userController.getWallet()!.maxBalance.toString();
    super.initState();
    getUserLoans();
  }

  @override
  Widget build(BuildContext context) {
    int loan = 0;
    bool repaid = (loans.isEmpty) ? true : loans[loans.length - 1].repaid;
    String status = (loans.isEmpty) ? " " : loans[loans.length - 1].status;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.mainColor,
        child: const Icon(
          Icons.message_outlined,
          size: 30,
        ),
        onPressed: () {},
      ),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(13.w, 19.h, 0, 19.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomText(
                        text: 'Explore Loan Offers',
                        color: WHITE,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      CustomText(
                        text: 'Based on your profile,'
                            'you are eligible\nfor the following loan amount',
                        fontSize: 12,
                        color: WHITE,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Center(
                  child: Column(
                children: [
                  CustomText(
                    text: 'Maximum Loan Amount',
                    fontSize: 14,
                  ),
                  CustomText(
                    text: myFormat.format(int.parse(maxBalance)),
                    fontSize: 35.0,
                    fontWeight: FontWeight.w500,
                    color: AppColors.buyyyon,
                  ),
                  SizedBox(height: 15.h),
                  customButton(
                    title: 'Request Loan',
                    fontSize: 16.0,
                    borderColor: AppColors.mainColor,
                    curve: 20.0,
                    color: WHITE,
                    textColor: AppColors.mainColor,
                    onPressed: () {
                      loan = int.parse(maxBalance);
                      if (repaid == false) {
                        showErrorSnackBar('Error!',
                            'You have not repaid your previous loan.');
                      } else {
                        Get.to(() => RequestSpecificAmount(amount: loan));
                      }
                    },
                  )
                ],
              )),
            ),
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.only(left: 34.w),
              child: CustomText(
                text: 'Want a different amount?',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF1E3B62),
              ),
            ),
            GestureDetector(
              onTap: () {
                loan = 7000;
                if (repaid == false) {
                  showErrorSnackBar(
                      'Error!', 'You have not repaid your previous loan.');
                } else {
                  Get.to(() => RequestSpecificAmount(amount: loan));
                }
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 34.w),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFFAFCFD),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 0.5,
                        blurRadius: 0.5,
                        offset:
                            const Offset(0, 4), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 19.h, horizontal: 30.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'NGN 7,000',
                          color: BLACK,
                        ),
                        CustomText(
                          text: 'Request',
                          fontSize: 12,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            GestureDetector(
              onTap: () {
                loan = 4500;
                if (repaid == false) {
                  showErrorSnackBar(
                      'Error!', 'You have not repaid your previous loan.');
                } else {
                  Get.to(() => RequestSpecificAmount(amount: loan));
                }
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 34.w),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFFAFCFD),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 0.5,
                        blurRadius: 0.5,
                        offset:
                            const Offset(0, 4), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 19.h, horizontal: 30.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'NGN 4,500',
                          color: BLACK,
                        ),
                        CustomText(
                          text: 'Request',
                          fontSize: 12,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            GestureDetector(
              onTap: () {
                loan = 3000;
                if (repaid == false) {
                  showErrorSnackBar(
                      'Error!', 'You have not repaid your previous loan.');
                } else {
                  Get.to(() => RequestSpecificAmount(amount: loan));
                }
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 34.w),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFFAFCFD),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 0.5,
                        blurRadius: 0.5,
                        offset:
                            const Offset(0, 4), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 19.h, horizontal: 30.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'NGN 3,000',
                          color: BLACK,
                        ),
                        CustomText(
                          text: 'Request',
                          fontSize: 12,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 42.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                      colors: [AppColors.lightGrey, AppColors.mainColor],
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(24.w, 23.h, 0, 35.h),
                      child: Column(
                        children: [
                          CustomText(
                            text: 'Interest Breakdown',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          CustomText(
                            text:
                                'Everything you need to\nknow about Momo Credit\ninterest policy',
                            fontSize: 12,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 118.h,
                        width: 168.w,
                        child: Image.asset('assets/images/[Downloader 1.png'),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
