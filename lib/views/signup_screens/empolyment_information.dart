import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momo/constants.dart';
import 'package:momo/custom_text.dart';
import 'package:momo/input_field.dart';
import 'package:momo/theme.dart';
import 'package:momo/views/signup_screens/emergency_contact.dart';
import 'package:momo/widget.dart';
import 'package:momo/widgets/appbar.dart';
import 'package:momo/widgets/dropdown_widget.dart';
import 'package:open_file/open_file.dart';

class EmploymentInformation extends StatefulWidget {
  const EmploymentInformation({Key? key}) : super(key: key);

  @override
  State<EmploymentInformation> createState() => _EmploymentInformationState();
}

class _EmploymentInformationState extends State<EmploymentInformation> {
  FilePickerResult? result;
  FilePickerResult? result2;
  PlatformFile? file1;
  PlatformFile? file2;

  void pickFiles() async {
    result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    file1 = result!.files.first;
    setState(() {});
  }

  void pickFiles2() async {
    result2 = await FilePicker.platform.pickFiles();
    if (result2 == null) return;
    file2 = result2!.files.first;
    setState(() {});
  }

  void viewFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  void viewFile2(PlatformFile file2) {
    OpenFile.open(file2.path);
  }

  final _formKey = GlobalKey<FormState>();

  String? selectedValue;

  final List<String> employment = ['Employed', 'Unemployed', 'Self-Employed'];

  final List<String> duration = ['1 - 2', '2 - 3', '3 - 4', '4 - 5'];

  final List<String> salary = [
    '10 - 50',
    '50 - 100',
    '100 - 200',
    '300 - 400',
    '400 - 500'
  ];
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
              SizedBox(height: 5.h),
              const CustomAppbar(
                text: 'Employment Information',
                textColor: AppColors.grey2,
                iconColor: BLACK,
                spacing: 20.0,
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
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 0.5,
                            blurRadius: 0.5,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(27.w, 12.h, 27.w, 24.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Employment Status',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            DropdownButtonFormField2(
                              decoration: InputDecoration(
                                isDense: true,
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
//Add more decoration as you want here
//Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                              ),
                              isExpanded: true,
                              scrollbarAlwaysShow: true,
                              hint: Text(
                                'Select employment status',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: GREY.withOpacity(0.9)),
                              ),
                              icon: const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: AppColors.mainColor,
                              ),
                              buttonHeight: 55.h,
                              buttonPadding:
                                  const EdgeInsets.only(left: 20, right: 10),
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              items: employment
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
                                  return 'Please select employment status.';
                                }
                                return null;
                              },
                              onChanged: (value) {
//Do something when changing the item if you want.
                              },
                              onSaved: (value) {
                                selectedValue = value.toString();
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 12.h),
                              child: const Text(
                                "Company's name",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            ),
                            const InputFormField(
                              label: 'Data.co',
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 12.0),
                              child: Text(
                                "Company's location",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            ),
                            const InputFormField(label: 'Lagos'),
                            Padding(
                              padding: EdgeInsets.only(top: 12.h),
                              child: const Text(
                                'Role',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            ),
                            const InputFormField(label: 'Sales'),
                            const Padding(
                              padding: EdgeInsets.only(top: 12.0),
                              child: Text(
                                'Duration',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            ),
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
//Add more decoration as you want here
//Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                              ),
                              isExpanded: true,
                              scrollbarAlwaysShow: true,
                              hint: Text(
                                '1 - 2 years',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: GREY.withOpacity(0.9)),
                              ),
                              icon: const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: AppColors.mainColor,
                              ),
                              buttonHeight: 55.h,
                              buttonPadding:
                                  const EdgeInsets.only(left: 20, right: 10),
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              items: duration
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item + ' Years',
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              validator: (value) {
                                if (value == null) {
                                  return 'Please select duration.';
                                }
                                return null;
                              },
                              onChanged: (value) {
//Do something when changing the item if you want.
                              },
                              onSaved: (value) {
                                selectedValue = value.toString();
                              },
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 12.0),
                              child: Text(
                                'Salary range',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            ),
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
//Add more decoration as you want here
//Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                              ),
                              isExpanded: true,
                              scrollbarAlwaysShow: true,
                              hint: Text(
                                '100 - 200 thousand',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: GREY.withOpacity(0.9)),
                              ),
                              icon: const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: AppColors.mainColor,
                              ),
                              buttonHeight: 55.h,
                              buttonPadding:
                                  const EdgeInsets.only(left: 20, right: 10),
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              items: salary
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item + ' Thousand',
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              validator: (value) {
                                if (value == null) {
                                  return 'Please select duration.';
                                }
                                return null;
                              },
                              onChanged: (value) {
//Do something when changing the item if you want.
                              },
                              onSaved: (value) {
                                selectedValue = value.toString();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w, right: 10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                              text:
                                  "Upload work ID to improve your\nchances of obtaining a loan.",
                              fontSize: 12),
                          Align(
                              alignment: Alignment.topRight,
                              child: CustomText(
                                text: 'Preview',
                                color: AppColors.laon3,
                                fontWeight: FontWeight.w300,
                                fontSize: 10,
                              )),
                          SizedBox(height: 6.h),
                          Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              color: WHITE,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 0.3,
                                  blurRadius: 0.3,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 30, 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: file1 == null
                                        ? const Icon(
                                            Icons.text_snippet_rounded,
                                            color: AppColors.grey4,
                                            size: 40,
                                          )
                                        : GestureDetector(
                                            onTap: () {
                                              viewFile(file1!);
                                            },
                                            child: SizedBox(
                                              width: 200.w,
                                              child: CustomText(
                                                text: '${file1?.name}',
                                                overFlow: TextOverflow.ellipsis,
                                                fontSize: 14.0,
                                              ),
                                            ),
                                          ),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      pickFiles();
                                    },
                                    child: CustomText(
                                      text: 'Browse',
                                      color: AppColors.secondaryColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          CustomText(
                              text:
                                  "Upload six month of recent bank statement\nto improve your chances of obtaining a loan.",
                              fontSize: 12),
                          Align(
                              alignment: Alignment.topRight,
                              child: CustomText(
                                text: 'Preview',
                                color: AppColors.laon3,
                                fontWeight: FontWeight.w300,
                                fontSize: 10,
                              )),
                          const SizedBox(height: 6),
                          Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              color: WHITE,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 0.3,
                                  blurRadius: 0.3,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsets.fromLTRB(20.w, 10.h, 30.w, 10.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  file2 == null
                                      ? const Icon(
                                          Icons.text_snippet_rounded,
                                          color: AppColors.grey4,
                                          size: 40,
                                        )
                                      : GestureDetector(
                                          onTap: () {
                                            viewFile2(file2!);
                                          },
                                          child: SizedBox(
                                            width: 200.w,
                                            child: CustomText(
                                              text: '${file2?.name}',
                                              overFlow: TextOverflow.ellipsis,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ),
                                  InkWell(
                                    onTap: () async {
                                      pickFiles2();
                                    },
                                    child: CustomText(
                                      text: 'Browse',
                                      color: AppColors.secondaryColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
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
                              Get.to(() => const EmergencyContact());
                              _formKey.currentState!.save();
                            }
                          }),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
