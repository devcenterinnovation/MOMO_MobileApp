import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momo/constants.dart';
import 'package:momo/controllers/user_controller.dart';
import 'package:momo/input_field.dart';
import 'package:momo/theme.dart';
import 'package:momo/widgets/appbar.dart';

class UserPersonalInformation extends StatefulWidget {
  const UserPersonalInformation({Key? key}) : super(key: key);

  @override
  State<UserPersonalInformation> createState() =>
      _UserPersonalInformationState();
}

class _UserPersonalInformationState extends State<UserPersonalInformation> {
  String gender = "";
  String firstName = '';
  String lastName = '';
  String middleName = '';
  String dob = '';
  String bvn = '';
  String nationality = '';
  UserController userController = Get.find();

  @override
  initState() {
    firstName = userController.getProfile()!.firstName;
    lastName = userController.getProfile()!.lastName;
    middleName = userController.getProfile()!.middleName;
    dob = userController.getProfile()!.dob;
    gender = userController.getProfile()!.gender;
    bvn = userController.getProfile()!.bvn;
    nationality = userController.getProfile()!.nationality;
    super.initState();
  }

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
          children: [
            const SizedBox(height: 5),
            const CustomAppbar(
              text: 'Personal Information',
              textColor: AppColors.grey2,
              iconColor: BLACK,
              spacing: 13.0,
              backgroundColor: Colors.transparent,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: WHITE,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 0.5,
                          blurRadius: 0.5,
                          offset:
                              const Offset(0, 5), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(27, 12, 27, 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'First Name',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                          InputFormField(
                            label: firstName,
                            hintColor: BLACK,
                            enabled: false,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 12.0),
                            child: Text(
                              'Middle Name(optional)',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          ),
                          InputFormField(
                            label: middleName,
                            hintColor: BLACK,
                            enabled: false,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 12.0),
                            child: Text(
                              'Surname',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          ),
                          InputFormField(
                            label: lastName,
                            hintColor: BLACK,
                            enabled: false,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 12.0),
                            child: Text(
                              'Date of birth',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          ),
                          InputFormField(
                            label: dob,
                            hintColor: BLACK,
                            enabled: false,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 12.0),
                            child: Text(
                              'Gender',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: RadioListTile(
                                  value: "male",
                                  groupValue: gender,
                                  contentPadding: EdgeInsets.zero,
                                  activeColor: const Color(0xFF1E3B62),
                                  title: const Text('Male'),
                            onChanged: (String? value) {  },
                                 ),
                                ),
                              Expanded(
                                child: RadioListTile(
                                  value: "female",
                                  title: const Text('Female'),
                                  groupValue: gender,
                                  contentPadding: EdgeInsets.zero,
                                  activeColor: const Color(0xFF1E3B62),
                                  onChanged: (String? value) {},
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 12.0),
                            child: Text(
                              'Nationality',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          ),
                           InputFormField(
                            label: userController.getProfile()!.nationality,
                            hintColor: BLACK,
                            enabled: false,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 12.0),
                            child: Text(
                              'Bvn',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          ),
                          InputFormField(
                            hintColor: BLACK,
                            enabled: false,
                            label: bvn,
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
