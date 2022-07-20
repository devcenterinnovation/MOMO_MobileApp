import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:momo/constants.dart';
import 'package:momo/controllers/user_controller.dart';
import 'package:momo/custom_text.dart';
import 'package:momo/theme.dart';
import 'package:momo/validator.dart';
import 'package:momo/views/user_profile/help.dart';
import 'package:momo/views/user_profile/refer_a_friend.dart';
import 'package:momo/views/user_profile/user_personal_information.dart';
import 'package:momo/views/user_profile/userbank_details.dart';
import 'package:momo/widget.dart';
import 'package:momo/widgets/appbar.dart';
import 'package:momo/widgets/custom_clipper.dart';
import 'package:momo/widgets/pass_field.dart';
import 'package:momo/widgets/text_with_divider.dart';
import 'package:shimmer/shimmer.dart';

class USerProfile extends StatefulWidget {
  const USerProfile({Key? key}) : super(key: key);

  @override
  State<USerProfile> createState() => _USerProfileState();
}

class _USerProfileState extends State<USerProfile> {
  String name = '';
  String lastName = '';
  String userId = '';
  String profileImage = '';
  final UserController userController = Get.find();

  @override
  initState() {
    name = userController.getProfile()!.firstName;
    profileImage = userController.getProfile()!.profilePicture;
    lastName = userController.getProfile()!.lastName;
    userId = userController.userId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Dialog errorDialog = Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)), //this right here
        child: GestureDetector(
          onTap: () => Get.back(),
          child: Container(
              height: 300.h,
              width: 300.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      image: NetworkImage(profileImage), fit: BoxFit.fill))),
        ));
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
                        iconColor: Colors.transparent,
                        spacing: 40.w,
                      ),
                      SizedBox(height: 41.h),
                      Center(
                        child: Column(
                          children: [
                            (profileImage.isEmpty)
                                ? Shimmer.fromColors(
                                    baseColor: Colors.grey.shade200,
                                    highlightColor: Colors.grey.shade300,
                                    child: Container(
                                      height: 70.h,
                                      width: 70.w,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      print('sam');
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              errorDialog);
                                    },
                                    child: Container(
                                      height: 70.h,
                                      width: 70.w,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage(profileImage),
                                              fit: BoxFit.fill)),
                                    ),
                                  ),
                            SizedBox(height: 8.h),
                            CustomText(
                              text: '$name  $lastName',
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
                                  text: userId.substring(0, 8),
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
                TextWithDivider(
                  onTap: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.0),
                              topRight: Radius.circular(15.0)),
                        ),
                        backgroundColor: const Color(0xFF4B6D9B),
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: Container(
                              child: Wrap(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 36.w, top: 20.h),
                                        child: CustomText(
                                          text: 'Change Password',
                                          color: WHITE,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const Spacer(),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 23.h, right: 25.w),
                                        child: InkWell(
                                          onTap: () => Get.back(),
                                          child: Container(
                                            height: 25.h,
                                            width: 25.w,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: WHITE, width: 1.0)),
                                            child: Icon(
                                              Icons.close,
                                              size: 20.h,
                                              color: WHITE,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 40.h,
                                        bottom: 60.h,
                                        left: 40.w,
                                        right: 40.w),
                                    child: Column(
                                      children: [
                                        PassFormField(
                                          hintColor: WHITE,
                                          hintSize: 16.0,
                                          label: 'Old Password',
                                          validator: (v) =>
                                              FieldValidator.validate(v),
                                        ),
                                        SizedBox(height: 30.h),
                                        PassFormField(
                                          hintColor: WHITE,
                                          hintSize: 16.0,
                                          label: 'New Password',
                                          validator: (v) =>
                                              FieldValidator.validate(v),
                                        ),
                                        SizedBox(height: 30.h),
                                        PassFormField(
                                          hintSize: 16.0,
                                          hintColor: WHITE,
                                          label: 'Confirm Password',
                                          validator: (v) =>
                                              FieldValidator.validate(v),
                                        ),
                                        SizedBox(height: 30.h),
                                        customButton(
                                            title: 'Save Password',
                                            color: WHITE,
                                            textColor: AppColors.mainColor)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  text: 'Password Security',
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
                      onTap: () => signOut(context),
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

  Future<void> signOut(context) async {
    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 0,
            actionsPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            content: SizedBox(
              width: double.maxFinite,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Wrap(
                  children: <Widget>[
                    Column(
                      children: [
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            children: [
                              const Center(
                                  child: Text(
                                "Sign Out?",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              )),
                              const SizedBox(height: 30),
                              const Center(
                                child: Text(
                                  "Signing out will end your current session. You will have to sign back in to resume session",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              const SizedBox(height: 30),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Row(
                                  children: [
                                    customButtons(
                                        color: AppColors.mainColor,
                                        title: 'Go Back',
                                        onPressed: () => Get.back()),
                                    const SizedBox(width: 10),
                                    customButtons(
                                      title: 'Sign Out',
                                      color: Colors.red,
                                      onPressed: () => userController.logOut(),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 25),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
