import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momo/constants.dart';
import 'package:momo/custom_text.dart';
import 'package:momo/widget.dart';
import 'package:momo/widgets/bottom_menu_nav.dart';

class ReferAndEarn extends StatelessWidget {
  const ReferAndEarn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            Image.asset('assets/images/image 23small.png'),
            CustomText(
              text: 'Congratulations',
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            const SizedBox(height: 5),
            CustomText(
              text: 'You’ve successfully paid off your loan',
              fontSize: 14,
            ),
            const SizedBox(height: 45),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                      text: 'Repayment details',
                      color: AppColors.laon3,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: const Color(0xFFF1F7FE),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(14, 30, 14, 27),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 34.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: 'Total Due',
                                  fontSize: 14,
                                  color: AppColors.laon3,
                                ),
                                CustomText(
                                  text: '3000',
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          const SizedBox(height: 11),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 34.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: 'Amount Paid',
                                  fontSize: 14,
                                  color: AppColors.laon3,
                                ),
                                CustomText(
                                  text: '1000',
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          const SizedBox(height: 11),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 34.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: 'Balance',
                                  fontSize: 14,
                                  color: AppColors.laon3,
                                ),
                                CustomText(
                                  text: '2000',
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                          ),
                          const Divider()
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: "Your loan payment is due on ",
                  fontSize: 14,
                  color: AppColors.laon3,
                ),
                CustomText(
                  text: ' 26 June',
                  fontWeight: FontWeight.w600,
                  color: AppColors.mainColor,
                )
              ],
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: customButton(title: 'Refer and Earn'),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => Get.to(() => const HomeNavigationBar()),
              child: CustomText(
                text: 'Go back home',
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
