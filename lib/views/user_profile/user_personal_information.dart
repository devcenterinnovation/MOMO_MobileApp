import 'package:flutter/material.dart';
import 'package:momo/constants.dart';
import 'package:momo/input_field.dart';
import 'package:momo/theme.dart';
import 'package:get/get.dart';
import 'package:momo/views/signup_screens/personal_information2.dart';
import 'package:momo/widget.dart';
import 'package:momo/widgets/appbar.dart';

class UserPersonalInformation extends StatefulWidget {
  const UserPersonalInformation({Key? key}) : super(key: key);

  @override
  State<UserPersonalInformation> createState() =>
      _UserPersonalInformationState();
}

class _UserPersonalInformationState extends State<UserPersonalInformation> {
  int _selectedValue = 0;
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
                          const InputFormField(
                            label: 'Sandra',
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
                          const InputFormField(
                            label: 'Cynthia',
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
                          const InputFormField(
                            label: 'John',
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
                          const InputFormField(
                            label: '05/ 22/ 1998',
                            hintColor: BLACK,
                            enabled: false,
                            suffixIcon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: AppColors.mainColor,
                              size: 20,
                            ),
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
                                  value: 1,
                                  groupValue: _selectedValue,
                                  contentPadding: EdgeInsets.zero,
                                  activeColor: const Color(0xFF1E3B62),
                                  title: const Text('Male'),
                                  onChanged: (value) => setState(() {
                                    _selectedValue = 1;
                                  }),
                                ),
                              ),
                              Expanded(
                                child: RadioListTile(
                                    value: 2,
                                    title: const Text('Female'),
                                    groupValue: _selectedValue,
                                    contentPadding: EdgeInsets.zero,
                                    activeColor: const Color(0xFF1E3B62),
                                    onChanged: (value) {
                                      setState(() => _selectedValue = 2);
                                    }),
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
                          const InputFormField(
                            label: 'Nigeria',
                            hintColor: BLACK,
                            enabled: false,
                            suffixIcon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: AppColors.mainColor,
                              size: 20,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 12.0),
                            child: Text(
                              'Bvn',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          ),
                          const InputFormField(
                            hintColor: BLACK,
                            enabled: false,
                            label: '105556000',
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
