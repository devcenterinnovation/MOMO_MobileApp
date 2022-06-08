import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:momo/constants.dart';
import 'package:momo/custom_text.dart';
import 'package:momo/input_field.dart';
import 'package:momo/theme.dart';
import 'package:momo/views/wallets/refer_and_earn.dart';
import 'package:momo/widget.dart';

class UpcomingPayment extends StatefulWidget {
  const UpcomingPayment({Key? key}) : super(key: key);

  @override
  State<UpcomingPayment> createState() => _UpcomingPaymentState();
}

class _UpcomingPaymentState extends State<UpcomingPayment> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 30.0),
          child: SvgPicture.asset('assets/images/ant-design_menu-outlined.svg'),
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
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/Rectangle 101.png'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(22, 27, 38, 24),
                  child: CustomText(
                    text: 'The repayment amount can be changed, '
                        'the\nminimum is N1000. Loan repayment'
                        ' can also be done\nahead of the due date. '
                        'Paying ahead increases\nyour chance of qualifying for '
                        'longer loan duration.',
                    fontSize: 11,
                    color: WHITE,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: AppColors.lightGreen,
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0, top: 5, bottom: 5),
                  child: Row(
                    children: [
                      SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset(
                              'assets/images/noto-v1_wrapped-gift.png')),
                      Padding(
                        padding: const EdgeInsets.only(left: 9.0),
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
              const SizedBox(height: 30),
              CustomText(
                  text: 'Upcoming Repayment',
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
              const SizedBox(height: 7),
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: const Color(0xFFF8F3F3),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(35, 22, 25, 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xFFDBB994),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0, vertical: 5),
                                child: CustomText(
                                  text: 'Approved',
                                  fontSize: 10,
                                  color: const Color(0xFF043933),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            CustomText(
                              text: '10 Mar 2022 : 10:12 AM',
                              fontSize: 10,
                              color: AppColors.laon3,
                            ),
                            const SizedBox(height: 6),
                            CustomText(
                              text: 'N3000',
                              fontWeight: FontWeight.w600,
                              color: BLACK,
                            ),
                            CustomText(
                              fontSize: 14,
                              text: 'Education Loan',
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
              const SizedBox(height: 30),
              CustomText(
                text: 'Repayment Method',
                fontSize: 14,
                color: AppColors.grey4,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  CustomText(text: 'Amount', fontSize: 14),
                  const Spacer(),
                  CustomText(text: 'Full payment', fontSize: 8),
                  const SizedBox(width: 5),
                  FlutterSwitch(
                    width: 38.0,
                    height: 16.0,
                    valueFontSize: 10.0,
                    toggleSize: 16.0,
                    toggleColor: AppColors.laon3,
                    inactiveColor: Color(0xFFF3F3F3),
                    activeColor: AppColors.mainColor,
                    activeToggleColor: WHITE,
                    value: status,
                    borderRadius: 16.0,
                    padding: 0.0,
                    showOnOff: false,
                    onToggle: (val) {
                      setState(() {
                        status = val;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const InputFormField(
                label: '1200',
                hintSize: 16.0,
                hintColor: BLACK,
                enabled: false,
              ),
              const SizedBox(height: 40),
              customButton(
                  title: 'Pay off Loan',
                  fontSize: 16.0,
                  onPressed: () => Get.to(() => const ReferAndEarn()))
            ],
          ),
        ),
      ),
    );
  }
}
