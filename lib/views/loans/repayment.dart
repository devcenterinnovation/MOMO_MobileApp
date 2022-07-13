import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:momo/constants.dart';
import 'package:momo/controllers/user_controller.dart';
import 'package:momo/custom_text.dart';
import 'package:momo/dialogs_snackbar.dart';
import 'package:momo/models/user_model.dart';
import 'package:momo/theme.dart';
import 'package:momo/views/loans/Congratulations.dart';
import 'package:momo/views/loans/loan_details.dart';
import 'package:momo/widget.dart';

class Repayment extends StatefulWidget {
  const Repayment({Key? key}) : super(key: key);

  @override
  State<Repayment> createState() => _RepaymentState();
}

class _RepaymentState extends State<Repayment> {
  bool status = false;

  String userId = '';
  String loanId = '';

  List<Loan> loans = [];
  UserController userController = Get.find();
  Future<bool> getUserLoans() async {
    final Uri uri =
        Uri.parse("https://momo-app-prdo9.ondigitalocean.app/users/" + userId);

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final result = userFromJson(response.body);

      loans = result.loans;
      setState(() {});
      return true;
    } else {
      return false;
    }
  }

  @override
  initState() {
    userId = userController.userId;
    super.initState();
    getUserLoans();
  }

  @override
  Widget build(BuildContext context) {
    NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
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
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(
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
          padding: EdgeInsets.symmetric(horizontal: 32.w),
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
                  padding: EdgeInsets.fromLTRB(22.w, 27.h, 38.w, 24.h),
                  child: CustomText(
                    text: 'The repayment amount can be changed, '
                        'the minimum is N1000. Loan repayment'
                        ' can also be done ahead of the due date. '
                        'Paying ahead increases your chance of qualifying for '
                        'longer loan duration.',
                    fontSize: 12,
                    color: WHITE,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: AppColors.lightGreen,
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: EdgeInsets.only(left: 30.w, top: 5.h, bottom: 5.h),
                  child: Row(
                    children: [
                      SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset(
                              'assets/images/noto-v1_wrapped-gift.png')),
                      Padding(
                        padding: EdgeInsets.only(left: 9.w),
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
                  text: 'Upcoming Repayment',
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
              SizedBox(height: 7.h),
              (loans.isEmpty)
                  ? Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: const Color(0xFFF8F3F3),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(35.w, 22.h, 25.w, 18.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: "N0",
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700,
                                    color: BLACK,
                                  ),
                                  CustomText(
                                    fontSize: 12,
                                    text: 'Loading . . .',
                                    color: AppColors.laon3,
                                  )
                                ],
                              ),
                              CustomText(
                                text: 'View details',
                                textDecoration: TextDecoration.underline,
                                underlineColor: AppColors.laon3,
                                fontSize: 12,
                                color: AppColors.laon3,
                              )
                            ],
                          )),
                    )
                  : Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: const Color(0xFFF8F3F3),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(35.w, 22.h, 25.w, 18.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: "N" +
                                        myFormat.format(loans[loans.length - 1]
                                            .repaymentAmount),
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700,
                                    color: BLACK,
                                  ),
                                  CustomText(
                                    fontSize: 12,
                                    text: loans[loans.length - 1].purpose,
                                    color: AppColors.laon3,
                                  )
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  loanId = loans[loans.length - 1].id!;
                                  Get.to(() => ViewDetails(loanId: loanId));
                                },
                                child: CustomText(
                                  text: 'View details',
                                  textDecoration: TextDecoration.underline,
                                  underlineColor: AppColors.laon3,
                                  fontSize: 12,
                                  color: AppColors.laon3,
                                ),
                              )
                            ],
                          )),
                    ),
              Row(
                children: [
                  CustomText(
                    text: "Your loan payment is due on ",
                    fontSize: 12,
                    color: AppColors.laon3,
                  ),
                  CustomText(
                    text: ' 26 June',
                    fontWeight: FontWeight.w600,
                    color: AppColors.mainColor,
                  )
                ],
              ),
              SizedBox(height: 25.h),
              CustomText(
                  text: 'Repayment Method',
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
              SizedBox(height: 10.h),
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: '3119307387',
                            fontSize: 20,
                            color: AppColors.mainColor,
                            fontWeight: FontWeight.w600,
                          ),
                          const SizedBox(width: 23),
                          InkWell(
                            onTap: () {
                              Clipboard.setData(
                                  const ClipboardData(text: '3119307387'));
                              showSuccessSnackBar('Virtual Account',
                                  'Your virtual account number has been copied.');
                            },
                            child: SvgPicture.asset(
                              'assets/images/Groupcopy.svg',
                              color: AppColors.mainColor,
                            ),
                          )
                        ],
                      ),
                      CustomText(
                        text: 'First Bank',
                        fontSize: 14,
                        color: AppColors.laon3,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: 15.h),
                      CustomText(
                        text: 'The is your virtual account Number',
                        fontWeight: FontWeight.w500,
                        color: AppColors.laon3,
                        fontSize: 14,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: CustomText(
                  text:
                      'You will get a confirmation once we receive your payment',
                  fontWeight: FontWeight.w500,
                  color: AppColors.laon3,
                  textAlign: TextAlign.center,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 15.h),
              customButton(
                  title: "I've made this payment.",
                  fontSize: 16.0,
                  radius: 10.0,
                  onPressed: () => Get.to(() => const Congratulations()))
            ],
          ),
        ),
      ),
    );
  }
}
