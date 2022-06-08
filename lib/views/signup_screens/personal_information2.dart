import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momo/constants.dart';
import 'package:momo/input_field.dart';
import 'package:momo/theme.dart';
import 'package:momo/views/signup_screens/empolyment_information.dart';
import 'package:momo/widget.dart';
import 'package:momo/widgets/appbar.dart';
import 'package:momo/widgets/dropdown_widget.dart';

class PersonalInformation2 extends StatefulWidget {
  const PersonalInformation2({Key? key}) : super(key: key);

  @override
  State<PersonalInformation2> createState() => _PersonalInformation2State();
}

class _PersonalInformation2State extends State<PersonalInformation2> {
  final List<String> children = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
  ];

  final List<String> education = [
    'School sat',
    'OND',
    'HND',
    'First Degree',
    'Masters',
    'PhD'
  ];

  final _formKey = GlobalKey<FormState>();

  String? selectedValue;
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
        child: Form(
          key: _formKey,
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
                padding: EdgeInsets.only(left: 20.0, right: 20, top: 30),
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
                            offset: const Offset(
                                0, 5), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(27, 12, 27, 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Highest Educational Level',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(height: 4.h),
                            DropdownButtonFormField2(
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: AppColors.mainColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.mainColor),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      BorderSide(color: AppColors.mainColor),
                                ),
//Add more decoration as you want here
//Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                              ),
                              isExpanded: true,
                              scrollbarAlwaysShow: true,
                              hint: const Text(
                                'Select number of children',
                                style: TextStyle(fontSize: 14),
                              ),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black45,
                              ),
                              iconSize: 30,
                              buttonHeight: 60,
                              buttonPadding:
                                  const EdgeInsets.only(left: 20, right: 10),
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              items: education
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              validator: (value) {
                                if (value == null) {
                                  return 'Please select highest educational level.';
                                }
                              },
                              onChanged: (value) {
//Do something when changing the item if you want.
                              },
                              onSaved: (value) {
                                selectedValue = value.toString();
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 12.0),
                              child: Text(
                                'Marital Status',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            ),
                            InputFormField(
                              label: 'Single',
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 12.0),
                              child: Text(
                                'Number of children',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            ),
                            DropdownButtonFormField2(
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: AppColors.mainColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.mainColor),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      BorderSide(color: AppColors.mainColor),
                                ),
//Add more decoration as you want here
//Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                              ),
                              isExpanded: true,
                              hint: const Text(
                                'Select Your state',
                                style: TextStyle(fontSize: 14),
                              ),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black45,
                              ),
                              iconSize: 30,
                              buttonHeight: 60,
                              buttonPadding:
                                  const EdgeInsets.only(left: 20, right: 10),
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              items: children
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              validator: (value) {
                                if (value == null) {
                                  return 'Please select highest educational level.';
                                }
                              },
                              onChanged: (value) {
//Do something when changing the item if you want.
                              },
                              onSaved: (value) {
                                selectedValue = value.toString();
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 12.0),
                              child: Text(
                                'Current Address',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            ),
                            InputFormField(
                              label: 'Lagos Island',
                              suffixIcon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: AppColors.mainColor,
                                size: 20,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 12.0),
                              child: Text(
                                'Current Address Details',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            ),
                            InputFormField(label: '2 oteri'),
                            Padding(
                              padding: EdgeInsets.only(top: 12.0),
                              child: Text(
                                'Email',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            ),
                            InputFormField(label: "inyangmatoni@gmail.com"),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: customButton(
                          title: 'Continue',
                          fontSize: 16.0,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Get.to(() => const EmploymentInformation());
                              _formKey.currentState!.save();
                            }
                          }),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
