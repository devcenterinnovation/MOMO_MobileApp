import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
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
  File? image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on Exception catch (e) {
      // ignore: avoid_print
      print('Failed to pick image: $e');
    }
  }

  final _formKey = GlobalKey<FormState>();
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
        Form(
          key: _formKey,
          child: FormField<bool>(
            builder: (state) {
              return Column(
                children: [
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () => pickImage(ImageSource.camera),
                        child: ClipOval(
                          child: Container(
                            height: 110,
                            width: 110,
                            color: AppColors.captions,
                            child: image == null
                                ? Center(
                                    child: CustomText(
                                      text: 'Take Photo',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                : Image.file(
                                    image!,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 1,
                        child: ClipOval(
                          child: GestureDetector(
                            onTap: () => pickImage(ImageSource.camera),
                            child: Container(
                              height: 30,
                              width: 30,
                              color: AppColors.mainColor,
                              child: const Icon(
                                Icons.photo_camera_outlined,
                                color: WHITE,
                                size: 14,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Text(
                      state.errorText ?? '',
                      style: TextStyle(
                        color: Colors.red.shade600,
                        fontSize: 12,
                      ),
                    ),
                  )
                ],
              );
            },
            validator: (value) {
              if (image == null) {
                return 'You need to take a selfie';
              } else {
                return null;
              }
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 40.0),
          child: customButton(
              title: 'Continue',
              fontSize: 16.0,
              onPressed: () {
                Get.to(() => const AddAccountDetails());
                if (_formKey.currentState!.validate()) {
                  Get.to(() => const AddAccountDetails());
                  _formKey.currentState!.save();
                }
              }),
        )
      ],
    ));
  }
}

/// Get from gallery

/// Get from Camera
