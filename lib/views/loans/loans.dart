import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:momo/constants.dart';
import 'package:momo/controllers/user_controller.dart';
import 'package:momo/custom_text.dart';
import 'package:momo/views/loans/loan_details.dart';
import 'package:momo/models/user_model.dart';
import 'package:momo/theme.dart';
import 'package:momo/views/loans/repayment.dart';
import 'package:momo/widgets/custom_clipper.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

class Loans extends StatefulWidget {
  const Loans({Key? key}) : super(key: key);

  @override
  State<Loans> createState() => _LoansState();
}

class _LoansState extends State<Loans> {
  NumberFormat myFormat = NumberFormat.decimalPattern('en_us');

  String loanId = '';
  String name = '';
  String lastName = '';
  String maxBalance = '';
  String userId = '';
  UserController userController = Get.find();
  List<Loan> loans = [];
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
    name = userController.getProfile()!.firstName;
    lastName = userController.getProfile()!.lastName;
    maxBalance = userController.getWallet()!.maxBalance.toString();
    userId = userController.userId;
    super.initState();
    getUserLoans();
  }

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
                                          text: '$name $lastName',
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
                                                            text:
                                                                'N $maxBalance',
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
                    height: 100.h,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage('assets/images/Frame 62.png'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 11.h, bottom: 14.h, left: 21.w, right: 40.w),
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomText(
                              text: 'Getting a Loan\nis made easy\nwith MOMO ',
                              color: WHITE,
                              fontSize: 16,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: WHITE,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 10.h),
                              child: CustomText(
                                text: 'Apply Now',
                                color: AppColors.mainColor,
                                fontSize: 14,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 45.h),
                Padding(
                  padding:
                      EdgeInsets.only(left: 30.w, right: 30.w, bottom: 12.h),
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
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    (loans.length == 0) ? Shimmer.fromColors(
                      baseColor: Colors.grey.shade200,
                      highlightColor: Colors.grey.shade300,
                      child: ListView.builder(
                          padding: const EdgeInsets.only(top: 0),
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: 30.w, right: 30.w, bottom: 10.h),
                              child: Container(
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF5F5F5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 33.w,
                                      right: 33.w,
                                      top: 15.h,
                                      bottom: 15.h),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            text: '',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                          ),
                                          CustomText(
                                            text: '',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                        ],
                                      ),
                                      CustomText(
                                        text: '',
                                        color: AppColors.laon3,
                                        fontSize: 12,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ):
                    ListView.builder(
                        padding: const EdgeInsets.only(top: 0),
                        shrinkWrap: true,
                        itemCount: loans.length,
                        itemBuilder: (context, index) {
                          final loan = loans[index];
                          return Padding(
                            padding: EdgeInsets.only(
                                left: 30.w, right: 30.w, bottom: 10.h),
                            child: Container(
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                color: Color(0xFFF5F5F5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 33.w,
                                    right: 33.w,
                                    top: 15.h,
                                    bottom: 15.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: loan.purpose,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                        ),
                                        CustomText(
                                          text: 'NGN ${myFormat.format(loan.repaymentAmount)}',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: (){
                                        loanId = loan.id!;
                                        Get.to(() => ViewDetails(loanId: loanId));
                                        print(loanId);
                                      },
                                      child: CustomText(
                                        text: 'View details',
                                        color: AppColors.laon3,
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ],
                ),
                SizedBox(height: 20.h),
              ],
            ),
          )
        ],
      ),
    );
  }
}
