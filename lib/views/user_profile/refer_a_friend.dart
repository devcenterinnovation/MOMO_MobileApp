import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:momo/constants.dart';
import 'package:momo/custom_text.dart';
import 'package:momo/input_field.dart';
import 'package:momo/theme.dart';
import 'package:momo/widget.dart';

class ReferFriend extends StatefulWidget {
  const ReferFriend({Key? key}) : super(key: key);

  @override
  State<ReferFriend> createState() => _ReferFriendState();
}

class _ReferFriendState extends State<ReferFriend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFAFA),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Center(
          child: SizedBox(
              height: 68,
              width: 69,
              child: Image.asset('assets/images/Momo logo 1.png')),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            const Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Icon(Icons.arrow_back_rounded),
            ),
            Center(
              child: Column(
                children: [
                  Image.asset('assets/images/image 15.png'),
                  CustomText(
                    text: 'Earn N500 per referrals',
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60.0),
                    child: CustomText(
                      text:
                          'Earn up to 500 naira when you refer a friend and the friend returns their loan before the due date',
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                      fontSize: 14,
                      color: AppColors.laon3,
                    ),
                  ),
                  const SizedBox(height: 27),
                  CustomText(
                    text: 'Your Referral code',
                    fontSize: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: 'L257328',
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(width: 23),
                      SvgPicture.asset('assets/images/Groupcopy.svg'),
                    ],
                  ),
                  const SizedBox(height: 78),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35.0),
                    child: InputFormField(
                      label: 'Enter Momo referral code',
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: customButton(
                        title: 'Apply Code',
                        color: WHITE,
                        borderColor: AppColors.mainColor,
                        textColor: AppColors.mainColor,
                        fontSize: 16.0),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
