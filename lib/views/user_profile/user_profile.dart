import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:momo/constants.dart';
import 'package:momo/custom_text.dart';
import 'package:momo/theme.dart';
import 'package:momo/views/signup_screens/onboarding_screens.dart';
import 'package:momo/views/user_profile/help.dart';
import 'package:momo/views/user_profile/refer_a_friend.dart';
import 'package:momo/views/user_profile/user_personal_information.dart';
import 'package:momo/views/user_profile/userbank_details.dart';
import 'package:momo/widgets/appbar.dart';
import 'package:momo/widgets/custom_clipper.dart';
import 'package:momo/widgets/text_with_divider.dart';

class USerProfile extends StatefulWidget {
  const USerProfile({Key? key}) : super(key: key);

  @override
  State<USerProfile> createState() => _USerProfileState();
}

class _USerProfileState extends State<USerProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  color: AppColors.secondaryColor,
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 60.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomAppbar(
                        text: 'Profile Setting',
                        textColor: WHITE,
                        iconColor: WHITE,
                        spacing: 40.w,
                      ),
                      SizedBox(height: 41.h),
                      Center(
                        child: Column(
                          children: [
                            Container(
                              height: 57.h,
                              width: 57.w,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/unsplash__cvwXhGqG-o.png'),
                                      fit: BoxFit.fill)),
                            ),
                            SizedBox(height: 8.h),
                            CustomText(
                              text: 'Janet  Richard',
                              color: WHITE,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  text: 'User ID',
                                  color: AppColors.grey4,
                                ),
                                SizedBox(width: 8.w),
                                CustomText(
                                  text: '3013489',
                                  color: WHITE,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                            SizedBox(height: 53.h),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 50.h),
            Column(
              children: [
                TextWithDivider(
                  onTap: () => Get.to(() => const UserPersonalInformation()),
                  text: 'Personal Information',
                  icon: Icons.person_outline,
                ),
                SizedBox(height: 20.h),
                TextWithDivider(
                  text: 'Bank Details',
                  onTap: () => Get.to(() => const UserBankDetails()),
                  icon: Icons.savings_outlined,
                ),
                SizedBox(height: 20.h),
                TextWithDivider(
                  text: 'Refer and Earn',
                  onTap: () => Get.to(() => const ReferFriend()),
                  icon: Icons.credit_card_outlined,
                ),
                SizedBox(height: 20.h),
                const TextWithDivider(
                  text: 'Account security',
                  icon: Icons.settings_outlined,
                ),
                SizedBox(height: 20.h),
                const TextWithDivider(
                  text: 'Rate The App',
                  icon: Icons.favorite_border_outlined,
                ),
                SizedBox(height: 20.h),
                GestureDetector(
                  onTap: () => Get.to(() => const Help()),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 45.w),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                                'assets/images/clarity_help-outline-badged.svg'),
                            SizedBox(width: 22.w),
                            CustomText(
                              text: 'Help',
                            )
                          ],
                        ),
                      ),
                      const Divider(color: AppColors.grey4)
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () => Get.offAll(() => const LoginPage()),
                      child: Padding(
                        padding: EdgeInsets.only(left: 45.w),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                                'assets/images/bx_log-out-circle.svg'),
                            SizedBox(width: 22.w),
                            CustomText(
                              text: 'Log Out',
                              color: RED,
                            )
                          ],
                        ),
                      ),
                    ),
                    const Divider(color: AppColors.grey4)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}