import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:momo/controllers/user_controller.dart';
import 'package:momo/custom_text.dart';
import 'package:momo/views/signup_screens/login_page.dart';
import 'package:momo/widget.dart';

class GetStarted extends StatefulWidget {
  File? profilePics;
  PlatformFile? workId;
  PlatformFile? bankStatement;

  GetStarted(
      {Key? key,
      required this.profilePics,
      required this.workId,
      required this.bankStatement})
      : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {

  String userId= '';


  UserController userController = Get.find();

  @override
  initState() {
    userId = userController.userId;
    super.initState();
  }


  onUploadImage() async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          "https://momo-app-prdo9.ondigitalocean.app/users/upload_profile_picture/$userId"),
    );
    Map<String, String> headers = {"Content-type": "multipart/form-data"};
    request.files.add(
      http.MultipartFile(
        'user_id',
        widget.profilePics!.readAsBytes().asStream(),
        widget.profilePics!.lengthSync(),
        filename: widget.profilePics!.path.split('/').last,
      ),
    );
    print("request: " + request.toString());
    var res = await request.send();
    http.Response response = await http.Response.fromStream(res);
  }

  onUploadDocument() async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          "https://momo-app-prdo9.ondigitalocean.app/users/upload_documents/$userId"),
    );
    Map<String, String> headers = {"Content-type": "multipart/form-data"};
    request.files.add(
        await http.MultipartFile.fromPath(
            'user_id',
            widget.workId!.path.toString()
        )

    );
    request.files.add(
        await http.MultipartFile.fromPath(
            'statement',
            widget.bankStatement!.path.toString()
        )

    );
    var res = await request.send();
    http.Response response = await http.Response.fromStream(res);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFAFAFA),
        body: Column(
          children: [
            SizedBox(height: 171.h),
            const Center(
              child: Image(
                  image: AssetImage(
                      'assets/images/[Downloader.la]-622cc4d8a59d8 1.png')),
            ),
            SizedBox(height: 27.h),
            Padding(
              padding: EdgeInsets.only(left: 50.w, right: 50.w),
              child: CustomText(
                text: 'You’ve successfully submitted all your\nBio data, '
                    'verification would take 24 working days. '
                    'Pending Verification, you’re not qualified to receive loan',
                fontSize: 14,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 40.w, right: 40.w),
              child: customButton(
                title: 'Get Started',
                onPressed:() {
                  onUploadImage();
                  onUploadDocument();
                  Get.offAll(() => const LoginPage());
                  print(userId);
                } ,
                fontSize: 16.0,
              ),
            )
          ],
        ));
  }
}
