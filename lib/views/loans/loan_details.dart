import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:momo/constants.dart';
import 'package:momo/custom_text.dart';
import 'package:momo/models/user_model.dart';
import 'package:momo/theme.dart';
import 'package:shimmer/shimmer.dart';

class ViewDetails extends StatefulWidget {
  final String loanId;
  const ViewDetails({Key? key, required this.loanId}) : super(key: key);

  @override
  State<ViewDetails> createState() => _ViewDetailsState();
}

class _ViewDetailsState extends State<ViewDetails> {
  NumberFormat myFormat = NumberFormat.decimalPattern('en_us');

  Loan? loan;
  String purpose = "";
  Future<bool> getUserLoan() async {
    final Uri uri = Uri.parse(
        "https://momo-app-prdo9.ondigitalocean.app/loans/" + widget.loanId);

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);

      loan = Loan.fromJson(result);

      print(result["purpose"]);
      setState(() {});
      return true;
    } else {
      return false;
    }
  }

  @override
  initState() {
    super.initState();
    getUserLoan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: InkWell(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.chevron_left,
              color: BLACK,
              size: 30,
            ),
          ),
        ),
        title: CustomText(
          text: 'Loan Details',
          color: BLACK,
        ),
        elevation: 0.5,
        backgroundColor: WHITE,
      ),
      body: SingleChildScrollView(
        child: (loan == null)?Shimmer.fromColors(
          baseColor: Colors.grey.shade200,
          highlightColor: Colors.grey.shade300,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: 23.w, right: 23.w, top: 20.h, bottom: 10.h),
                child: Row(
                  children: [
                    CustomText(
                      text: 'User Id ',
                      fontSize: 16,
                    ),
                    Spacer(),
                    CustomText(
                      text:
                          loan?.id.toString().substring(0, 8) ?? 'Loading . . . .',
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    )
                  ],
                ),
              ),
              const Divider(
                color: AppColors.Tertiary,
                thickness: 0.5,
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.only(left: 23.w, right: 23.w, bottom: 10.h),
                child: Row(
                  children: [
                    CustomText(
                      text: 'Loan Amount',
                      fontSize: 16,
                    ),
                    Spacer(),
                    CustomText(
                      text: "NGN ${loan?.amount.toString() ?? 'Loading . . . .'}",
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    )
                  ],
                ),
              ),
              const Divider(
                color: AppColors.Tertiary,
                thickness: 0.5,
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.only(left: 23.w, right: 23.w, bottom: 10.h),
                child: Row(
                  children: [
                    CustomText(
                      text: 'Amount Disbursed',
                      fontSize: 16,
                    ),
                    Spacer(),
                    CustomText(
                      text:
                          "NGN ${loan?.amountDisbursed.toString() ?? 'Loading . . . .'}",
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    )
                  ],
                ),
              ),
              const Divider(
                color: AppColors.Tertiary,
                thickness: 0.5,
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.only(left: 23.w, right: 23.w, bottom: 10.h),
                child: Row(
                  children: [
                    CustomText(
                      text: 'Term',
                      fontSize: 16,
                    ),
                    Spacer(),
                    CustomText(
                      text: "${loan?.term.toString() ?? '0'} Days",
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    )
                  ],
                ),
              ),
              const Divider(
                color: AppColors.Tertiary,
                thickness: 0.5,
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.only(left: 23.w, right: 23.w, bottom: 10.h),
                child: Row(
                  children: [
                    CustomText(
                      text: 'Service Charge',
                      fontSize: 16,
                    ),
                    Spacer(),
                    CustomText(
                      text: 'NGN ${loan?.serviceCharge.toString() ?? '0'}',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    )
                  ],
                ),
              ),
              const Divider(
                color: AppColors.Tertiary,
                thickness: 0.5,
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.only(left: 23.w, right: 23.w, bottom: 10.h),
                child: Row(
                  children: [
                    CustomText(
                      text: 'Interest',
                      fontSize: 16,
                    ),
                    Spacer(),
                    CustomText(
                      text: 'NGN ${loan?.interest.toString() ?? '0'}',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    )
                  ],
                ),
              ),
              const Divider(
                color: AppColors.Tertiary,
                thickness: 0.5,
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.only(left: 23.w, right: 23.w, bottom: 10.h),
                child: Row(
                  children: [
                    CustomText(
                      text: 'Purpose',
                      fontSize: 16,
                    ),
                    Spacer(),
                    CustomText(
                      text: loan?.purpose??'-',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    )
                  ],
                ),
              ),
              const Divider(
                color: AppColors.Tertiary,
                thickness: 0.5,
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.only(left: 23.w, right: 23.w, bottom: 10.h),
                child: Row(
                  children: [
                    CustomText(
                      text: 'Application Date',
                      fontSize: 16,
                    ),
                    Spacer(),
                    CustomText(
                      text: '-',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    )
                  ],
                ),
              ),
              const Divider(
                color: AppColors.Tertiary,
                thickness: 0.5,
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.only(left: 23.w, right: 23.w, bottom: 10.h),
                child: Row(
                  children: [
                    CustomText(
                      text: 'Disbursement Date',
                      fontSize: 16,
                    ),
                    Spacer(),
                    CustomText(
                      text: loan?.disbursementDate??'-',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    )
                  ],
                ),
              ),
              const Divider(
                color: AppColors.Tertiary,
                thickness: 0.5,
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.only(left: 23.w, right: 23.w, bottom: 10.h),
                child: Row(
                  children: [
                    CustomText(
                      text: 'Repayment Date',
                      fontSize: 16,
                    ),
                    Spacer(),
                    CustomText(
                      text: '-',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    )
                  ],
                ),
              ),
              const Divider(
                color: AppColors.Tertiary,
                thickness: 0.5,
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.only(left: 23.w, right: 23.w, bottom: 10.h),
                child: Row(
                  children: [
                    CustomText(
                      text: 'Remake',
                      fontSize: 16,
                    ),
                    Spacer(),
                    CustomText(
                      text: loan?.remark??'-',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    )
                  ],
                ),
              ),
              const Divider(
                color: AppColors.Tertiary,
                thickness: 0.5,
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.only(left: 23.w, right: 23.w, bottom: 10.h),
                child: Row(
                  children: [
                    CustomText(
                      text: 'Status',
                      fontSize: 16,
                    ),
                    Spacer(),
                    CustomText(
                      text: loan?.status??'-',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    )
                  ],
                ),
              ),
              const Divider(
                color: AppColors.Tertiary,
                thickness: 0.5,
              ),
            ],
          ),
        ):Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 23.w, right: 23.w, top: 20.h, bottom: 10.h),
              child: Row(
                children: [
                  CustomText(
                    text: 'User Id ',
                    fontSize: 16,
                  ),
                  Spacer(),
                  CustomText(
                    text:
                    loan?.id.toString().substring(0, 8) ?? 'Loading . . . .',
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
            ),
            const Divider(
              color: AppColors.Tertiary,
              thickness: 0.5,
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 23.w, right: 23.w, bottom: 10.h),
              child: Row(
                children: [
                  CustomText(
                    text: 'Loan Amount',
                    fontSize: 16,
                  ),
                  Spacer(),
                  CustomText(
                    text: "NGN ${myFormat.format(loan?.amount)}",
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
            ),
            const Divider(
              color: AppColors.Tertiary,
              thickness: 0.5,
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 23.w, right: 23.w, bottom: 10.h),
              child: Row(
                children: [
                  CustomText(
                    text: 'Amount Disbursed',
                    fontSize: 16,
                  ),
                  Spacer(),
                  CustomText(
                    text:
                    "NGN ${loan?.amountDisbursed.toString() ?? 'Loading . . . .'}",
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
            ),
            const Divider(
              color: AppColors.Tertiary,
              thickness: 0.5,
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 23.w, right: 23.w, bottom: 10.h),
              child: Row(
                children: [
                  CustomText(
                    text: 'Term',
                    fontSize: 16,
                  ),
                  Spacer(),
                  CustomText(
                    text: "${loan?.term.toString() ?? '0'} Days",
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
            ),
            const Divider(
              color: AppColors.Tertiary,
              thickness: 0.5,
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 23.w, right: 23.w, bottom: 10.h),
              child: Row(
                children: [
                  CustomText(
                    text: 'Service Charge',
                    fontSize: 16,
                  ),
                  Spacer(),
                  CustomText(
                    text: 'NGN ${loan?.serviceCharge.toString() ?? '0'}',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
            ),
            const Divider(
              color: AppColors.Tertiary,
              thickness: 0.5,
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 23.w, right: 23.w, bottom: 10.h),
              child: Row(
                children: [
                  CustomText(
                    text: 'Interest',
                    fontSize: 16,
                  ),
                  Spacer(),
                  CustomText(
                    text: 'NGN ${loan?.interest.toString() ?? '0'}',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
            ),
            const Divider(
              color: AppColors.Tertiary,
              thickness: 0.5,
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 23.w, right: 23.w, bottom: 10.h),
              child: Row(
                children: [
                  CustomText(
                    text: 'Purpose',
                    fontSize: 16,
                  ),
                  Spacer(),
                  CustomText(
                    text: loan?.purpose??'-',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
            ),
            const Divider(
              color: AppColors.Tertiary,
              thickness: 0.5,
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 23.w, right: 23.w, bottom: 10.h),
              child: Row(
                children: [
                  CustomText(
                    text: 'Application Date',
                    fontSize: 16,
                  ),
                  Spacer(),
                  CustomText(
                    text: '-',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
            ),
            const Divider(
              color: AppColors.Tertiary,
              thickness: 0.5,
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 23.w, right: 23.w, bottom: 10.h),
              child: Row(
                children: [
                  CustomText(
                    text: 'Disbursement Date',
                    fontSize: 16,
                  ),
                  Spacer(),
                  CustomText(
                    text: loan?.disbursementDate??'-',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
            ),
            const Divider(
              color: AppColors.Tertiary,
              thickness: 0.5,
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 23.w, right: 23.w, bottom: 10.h),
              child: Row(
                children: [
                  CustomText(
                    text: 'Repayment Date',
                    fontSize: 16,
                  ),
                  Spacer(),
                  CustomText(
                    text: '-',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
            ),
            const Divider(
              color: AppColors.Tertiary,
              thickness: 0.5,
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 23.w, right: 23.w, bottom: 10.h),
              child: Row(
                children: [
                  CustomText(
                    text: 'Remake',
                    fontSize: 16,
                  ),
                  Spacer(),
                  CustomText(
                    text: loan?.remark??'-',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
            ),
            const Divider(
              color: AppColors.Tertiary,
              thickness: 0.5,
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 23.w, right: 23.w, bottom: 10.h),
              child: Row(
                children: [
                  CustomText(
                    text: 'Status',
                    fontSize: 16,
                  ),
                  Spacer(),
                  CustomText(
                    text: loan?.status??'-',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
            ),
            const Divider(
              color: AppColors.Tertiary,
              thickness: 0.5,
            ),
          ],
        ),
      ),
    );
  }
}
