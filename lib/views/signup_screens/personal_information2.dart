import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momo/constants.dart';
import 'package:momo/input_field.dart';
import 'package:momo/theme.dart';
import 'package:momo/validator.dart';
import 'package:momo/views/signup_screens/empolyment_information.dart';
import 'package:momo/widget.dart';
import 'package:momo/widgets/appbar.dart';
import 'package:momo/widgets/dropdown_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalInformation2 extends StatefulWidget {

  PersonalInformation2({Key? key}) : super(key: key);

  @override
  State<PersonalInformation2> createState() => _PersonalInformation2State();
}

class _PersonalInformation2State extends State<PersonalInformation2> {

  String maritalStat = "";
  String selEducation = "";
  String noc = "";
  String address = "";

  final addressController = TextEditingController();
  final emailController = TextEditingController();


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
    '9'
  ];

  final List<String> education = [
    'SSCE',
    'OND',
    'HND',
    'B.Sc',
    'Masters',
    'PhD',
    'Others'
  ];

  final List<String> location = ['Lagos', 'Oyo', 'Ogun', 'Ondo', 'Osun', 'Edo'];

  final List<String> maritalStatus = ['Single', 'Married', 'Divorced'];

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
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h),
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
                        padding: EdgeInsets.fromLTRB(27.w, 12.h, 27.w, 24.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Highest Educational Level',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(height: 4.h),

                            // Educational Dropdown
                            DropdownButtonFormField2(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: AppColors.mainColor, width: 0.8),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColors.mainColor, width: 0.8),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                      color: AppColors.mainColor, width: 0.8),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                      color: AppColors.mainColor, width: 0.8),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      const BorderSide(color: RED, width: 0.8),
                                ),
//Add more decoration as you want here
//Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                              ),
                              isExpanded: true,
                              scrollbarAlwaysShow: true,
                              hint: Text(
                                'Select highest level of education',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: GREY.withOpacity(0.9)),
                              ),
                              icon: const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: AppColors.mainColor,
                              ),
                              buttonHeight: 50.h,
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
                                  return 'Please select highest level of education.';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                selEducation = value.toString();
                              },
                              onSaved: (value) {
                                selectedValue = value.toString();
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 12.h),
                              child: const Text(
                                'Marital Status',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            ),

                            // Select marital status dropdown
                            DropdownButtonFormField2(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: AppColors.mainColor, width: 0.8),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColors.mainColor, width: 0.8),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                      color: AppColors.mainColor, width: 0.8),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                      color: AppColors.mainColor, width: 0.8),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      const BorderSide(color: RED, width: 0.8),
                                ),
//Add more decoration as you want here
//Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                              ),
                              isExpanded: true,
                              scrollbarAlwaysShow: true,
                              hint: Text(
                                'Select your marital status',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: GREY.withOpacity(0.9)),
                              ),
                              icon: const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: AppColors.mainColor,
                              ),
                              buttonHeight: 50.h,
                              buttonPadding:
                                  const EdgeInsets.only(left: 20, right: 10),
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              items: maritalStatus
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
                                  return 'Please Select your marital status.';
                                }
                                return null;
                              },
                              onChanged: (value) {
                              maritalStat = value.toString();
                              },
                              onSaved: (value) {
                                selectedValue = value.toString();
                              },
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 12.0),
                              child: Text(
                                'Number of children',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            ),

                            // Number of children dropdown
                            DropdownButtonFormField2(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: AppColors.mainColor, width: 0.8),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColors.mainColor, width: 0.8),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                      color: AppColors.mainColor, width: 0.8),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                      color: AppColors.mainColor, width: 0.8),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      const BorderSide(color: RED, width: 0.8),
                                ),
//Add more decoration as you want here
//Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                              ),
                              isExpanded: true,
                              scrollbarAlwaysShow: true,
                              hint: Text(
                                'Select number of children',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: GREY.withOpacity(0.9)),
                              ),
                              icon: const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: AppColors.mainColor,
                              ),
                              buttonHeight: 50.h,
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
                                  return 'Please Select number of children.';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                noc = value.toString();
                              },
                              onSaved: (value) {
                                selectedValue = value.toString();
                              },
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 12.0),
                              child: Text(
                                'Current Address',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            ),

                            // Current address dropdown
                            DropdownButtonFormField2(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: AppColors.mainColor, width: 0.8),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColors.mainColor, width: 0.8),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                      color: AppColors.mainColor, width: 0.8),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                      color: AppColors.mainColor, width: 0.8),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      const BorderSide(color: RED, width: 0.8),
                                ),
//Add more decoration as you want here
//Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                              ),
                              isExpanded: true,
                              scrollbarAlwaysShow: true,
                              hint: Text(
                                'Select your state',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: GREY.withOpacity(0.9)),
                              ),
                              icon: const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: AppColors.mainColor,
                              ),
                              buttonHeight: 50.h,
                              buttonPadding:
                                  const EdgeInsets.only(left: 20, right: 10),
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              items: location
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
                                  return 'Please Select your state.';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                address = value.toString();
                              },
                              onSaved: (value) {
                                selectedValue = value.toString();
                              },
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 12.0),
                              child: Text(
                                'Current Address Details',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            ),
                            InputFormField(
                              label: '2 oteri',
                              controller: addressController,
                              validator: (v) => FieldValidator.validate(v),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 12.0),
                              child: Text(
                                'Email',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            ),
                            InputFormField(
                              label: "inyangmatoni@gmail.com",
                              controller: emailController,
                              validator: (v) => EmailValidator.validateEmail(v),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                   // CustomText(text: phone),
                   //  ElevatedButton(
                   //    child: Text("retrieve"),
                   //    onPressed: () {
                   //      retrieve();
                   //    },
                   //  ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: customButton(
                          title: 'Continue',
                          fontSize: 16.0,
                          onPressed: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            if (_formKey.currentState!.validate()) {
                              prefs.setString("education", selEducation);
                              prefs.setString("maritalStatus", maritalStat);
                              prefs.setString("children", noc);
                              prefs.setString(
                                  "address", address);
                              prefs.setString(
                                  "addressDetails", addressController.text);
                              prefs.setString(
                                  "email", emailController.text);
                              Get.to(() => const EmploymentInformation());
                              _formKey.currentState!.save();
                            }
                          }),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30.h)
            ],
          ),
        ),
      ),
    );
  }
}
