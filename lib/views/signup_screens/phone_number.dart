import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momo/constants.dart';
import 'package:momo/custom_text.dart';
import 'package:momo/theme.dart';
import 'package:momo/validator.dart';
import 'package:momo/views/signup_screens/verify_code.dart';
import 'package:momo/widget.dart';

class PhoneNumber extends StatefulWidget {
  const PhoneNumber({Key? key}) : super(key: key);

  @override
  State<PhoneNumber> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  //String _mobile = "";
  final _formKey = GlobalKey<FormState>();

  String forLoginVal = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: Column(
              children: [
                SizedBox(height: 150.h),
                CustomText(
                  text: 'Input your phone number',
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 26.h),
                SizedBox(
                  height: 212.6.h,
                  width: 116.35.w,
                  child: Image.asset('assets/images/Group 294.png'),
                ),
                SizedBox(height: 50.h),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    maxLength: 10,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    validator: (v) =>
                        NumberValidator.validateNumber(v!),
                    onChanged: (val) {
                      setState(() => forLoginVal = val);
                      print(val);
                    },
                    decoration: InputDecoration(
                      hintText: 'Your phone number',
                      hintStyle: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w400),
                      prefix: Padding(
                        padding: EdgeInsets.only(left: 8.0.w, right: 16.w),
                        child: CustomText(text: '+234 |', color: BLACK),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.secondary),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.secondary),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                CustomText(
                  text: 'We will send you a one time OTP code,'
                      'Input code to verify mobile number',
                  fontSize: 12,
                ),
                SizedBox(height: 32.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: customButton(
                    title: 'Continue',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Get.to(
                            () => PinCodeVerificationScreen("0" + forLoginVal));
                      }
                    },
                    borderColor: AppColors.mainColor,
                    textColor: AppColors.mainColor,
                    color: WHITE,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
