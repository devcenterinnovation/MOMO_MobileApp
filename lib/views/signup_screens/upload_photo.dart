import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momo/constants.dart';
import 'package:momo/custom_text.dart';
import 'package:momo/theme.dart';
import 'package:momo/views/signup_screens/account_details.dart';
import 'package:momo/widget.dart';

class UploadPicture extends StatefulWidget {
  const UploadPicture({Key? key}) : super(key: key);

  @override
  State<UploadPicture> createState() => _UploadPictureState();
}

class _UploadPictureState extends State<UploadPicture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 114),
        Center(
          child: CustomText(
            text: 'Upload Photo',
            color: AppColors.grey2,
          ),
        ),
        const SizedBox(height: 60),
        CustomText(
          text: 'We need a photo of you to verify your identity',
          fontSize: 14,
        ),
        const SizedBox(height: 30),
        Stack(
          children: [
            ClipOval(
              child: Container(
                height: 110,
                width: 110,
                color: AppColors.captions,
                child: Center(
                  child: CustomText(
                    text: 'Take Photo',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 1,
              child: ClipOval(
                child: Container(
                  height: 24,
                  width: 24,
                  color: AppColors.mainColor,
                  child: const Icon(
                    Icons.photo_camera_outlined,
                    color: WHITE,
                    size: 14,
                  ),
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 40.0),
          child: customButton(
              title: 'Continue',
              fontSize: 16.0,
              onPressed: () => Get.to(() => const AddAccountDetails())),
        )
      ],
    ));
  }
}
