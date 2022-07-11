import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momo/constants.dart';
import 'package:momo/controllers/user_controller.dart';
import 'package:momo/custom_text.dart';
import 'package:momo/dialogs_snackbar.dart';
import 'package:momo/input_field.dart';
import 'package:momo/services/auth_services.dart';
import 'package:momo/services/internet_services.dart';
import 'package:momo/theme.dart';
import 'package:momo/views/signup_screens/get_started.dart';
import 'package:momo/widget.dart';
import 'package:momo/widgets/appbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddAccountDetails extends StatefulWidget {
  File? profilePics;
  PlatformFile? workId;
  PlatformFile? bankStatement;
   AddAccountDetails({Key? key, required this.profilePics, required this.workId, required this.bankStatement}) : super(key: key);

  @override
  State<AddAccountDetails> createState() => _AddAccountDetailsState();
}

class _AddAccountDetailsState extends State<AddAccountDetails> {
 late String userId;
  final accountNumberController = TextEditingController();
  final bankNameController = TextEditingController();
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {
      retrieve();
    });
    super.initState();
  }

  late SharedPreferences prefs;
  String firstName = "";
  String lastName = "";
  String middleName = "";
  String dob = "";
  String gender = "";
  String email = "";
  String address = "";
  String addressDetails = "";
  String highEducation = "";
  String maritalStat = "";
  String selEducation = "";
  int noc = 0;
  String phone = "";
  String password = "";
  String relationship = "";
  String familyName = "";
  String familyPhone = "";
  String colleagueName = "";
  String colleaguePhone = "";
  String bvn = "";
  bool employed = false;
  String companyName = "";
  String companyLocation = "";
  String companyRole = "";
  String duration = "";
  String salary = "";

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
            child: Image.asset('assets/images/Momo logo 1.png'),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 5),
            const CustomAppbar(
              text: 'Add Account Details',
              textColor: AppColors.grey2,
              iconColor: BLACK,
              spacing: 35.0,
              backgroundColor: Colors.transparent,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 45.0, right: 45),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFFFAFAFA),
                          ),
                          child: Image.asset('assets/images/image 14.png'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 19.0),
                        child: CustomText(
                          text: 'Account Number',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      InputFormField(
                          label: '1001 09200 0199',
                          controller: accountNumberController),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: CustomText(
                          text: 'Bank Name',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      InputFormField(
                        label: 'John do',
                        controller: bankNameController,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: CustomText(
                          text: 'Account Name',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const InputFormField(
                        label: '5134 15277 9226 82992',
                        enabled: false,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                  child: customButton(
                      title: 'Add',
                      fontSize: 16.0,
                      onPressed: () {
                        _submit(context);
                      }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  retrieve() async {
    prefs = await SharedPreferences.getInstance();
    firstName = prefs.getString("firstName")!;
    middleName = prefs.getString("middleName")!;
    lastName = prefs.getString("lastName")!;
    dob = prefs.getString("dob")!;
    email = prefs.getString("email")!;
    address = prefs.getString("address")!;
    addressDetails = prefs.getString("addressDetails")!;
    gender = prefs.getString("gender")!;
    phone = prefs.getString("phone")!;
    noc = int.parse(prefs.getString("children")!);
    highEducation = prefs.getString("education")!;
    bvn = prefs.getString("bvn")!;
    employed = prefs.getBool("employed")!;
    companyName = prefs.getString("companyName")!;
    companyLocation = prefs.getString("companyLocation")!;
    companyRole = prefs.getString("companyRole")!;
    duration = prefs.getString("duration")!;
    salary = prefs.getString("salary")!;
    maritalStat = prefs.getString("maritalStatus")!;
    password = prefs.getString("password")!;
    relationship = prefs.getString("relationship")!;
    familyName = prefs.getString("familyName")!;
    familyPhone = prefs.getString("familyPhone")!;
    colleagueName = prefs.getString("colleagueName")!;
    colleaguePhone = prefs.getString("colleaguePhone")!;

    setState(() {});
  }

  void _submit(context) async {
    if (await InternetUtils.checkConnectivity()) {
      loadingDialog(context);

      var response = await AuthenticationService.signup(
        firstName,
        middleName,
        lastName,
        dob,
        email,
        address,
        addressDetails,
        phone,
        gender,
        maritalStat,
        noc,
        highEducation,
        bvn,
        password,
        employed,
        companyName,
        companyLocation,
        companyRole,
        duration,
        salary,
        accountNumberController.text,
        bankNameController.text,
        relationship,
        familyName,
        familyPhone,
        colleagueName,
        colleaguePhone,
      );

      if (response is String) {
        if (response.contains('HttpException') || response.contains('Socket')) {
          showErrorSnackBar('Error!', 'User already exists');
        }
      } else {
        String userId = response["id"];
        print(userId);


        UserController userController =
        Get.put(UserController(), permanent: true);
        await userController.setUserId(userId);

        Get.to(() =>  GetStarted(profilePics: widget.profilePics, workId: widget.workId, bankStatement: widget.bankStatement));


        print(userId);

      }
    }
  }
}
