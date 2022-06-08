import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momo/constants.dart';
import 'package:momo/custom_text.dart';
import 'package:momo/input_field.dart';
import 'package:momo/theme.dart';
import 'package:momo/views/signup_screens/emergency_information.dart';
import 'package:momo/widget.dart';
import 'package:momo/widgets/appbar.dart';
import 'package:open_file/open_file.dart';

class EmploymentInformation extends StatefulWidget {
  const EmploymentInformation({Key? key}) : super(key: key);

  @override
  State<EmploymentInformation> createState() => _EmploymentInformationState();
}

class _EmploymentInformationState extends State<EmploymentInformation> {
  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['pdf', 'png', 'jpg']);
    if (result == null) return;

    // we get the file from result object
    final file = result.files.first;

    _openFile(file);

    debugPrint(result.files.first.name);
    print(result.files.first.size);
    print(result.files.first.path);
  }

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
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
                          offset:
                              const Offset(0, 3), // changes position of shadow
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
                          const InputFormField(
                            label: 'Employed',
                            suffixIcon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: AppColors.mainColor,
                              size: 20,
                            ),
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
                          const InputFormField(
                            label: '3 - 5 years',
                            suffixIcon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: AppColors.mainColor,
                              size: 20,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 12.0),
                            child: Text(
                              'Salary range',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          ),
                          const InputFormField(
                            label: "100 - 200 thousand",
                            suffixIcon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: AppColors.mainColor,
                              size: 20,
                            ),
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
                            padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  Icons.text_snippet_rounded,
                                  color: AppColors.grey4,
                                  size: 40,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _pickFile();
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
                                EdgeInsets.fromLTRB(30.w, 10.h, 30.w, 10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  Icons.text_snippet_rounded,
                                  color: AppColors.grey4,
                                  size: 40,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _pickFile();
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
                        onPressed: () =>
                            Get.to(() => const EmergencyContact())),
                  )
                ],
              ),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
