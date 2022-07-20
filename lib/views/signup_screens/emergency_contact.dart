import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:get/get.dart';
import 'package:momo/constants.dart';
import 'package:momo/custom_text.dart';
import 'package:momo/input_field.dart';
import 'package:momo/theme.dart';
import 'package:momo/views/signup_screens/upload_photo.dart';
import 'package:momo/widget.dart';
import 'package:momo/widgets/appbar.dart';
import 'package:momo/widgets/dropdown_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmergencyContact extends StatefulWidget {
  PlatformFile? workId;
  PlatformFile? bankStatement;
  EmergencyContact(
      {Key? key, required this.workId, required this.bankStatement})
      : super(key: key);

  @override
  State<EmergencyContact> createState() => _EmergencyContactState();
}

class _EmergencyContactState extends State<EmergencyContact> {
  PhoneContact? _phoneContact;
  PhoneContact? _colleagueContact;

  String? selectedValue;

  String family = "";

  //late final Guarantor guarantor;

  final List<String> relation = [
    'Mother',
    'Father',
    'Brother',
    'Sister',
    'Son',
    'Daughter'
  ];

  final _formKey = GlobalKey<FormState>();

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
                text: 'Emergency Contact',
                textColor: AppColors.grey2,
                iconColor: BLACK,
                spacing: 15.0,
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
                            offset: const Offset(
                                0, 5), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.maxFinite,
                            decoration: const BoxDecoration(
                                color: AppColors.mainColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                )),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 14.0, bottom: 10.0),
                              child: Center(
                                  child: CustomText(
                                text: 'Family Contact',
                                color: WHITE,
                                fontSize: 16,
                              )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(27, 12, 27, 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 12.0),
                                  child: CustomText(
                                    text: 'Relationship',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                DropdownButtonFormField2(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.zero,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: AppColors.mainColor,
                                          width: 0.8),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: AppColors.mainColor,
                                          width: 0.8),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                          color: AppColors.mainColor,
                                          width: 0.8),
                                    ),
//Add more decoration as you want here
//Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                                  ),
                                  isExpanded: true,
                                  scrollbarAlwaysShow: true,
                                  hint: Text(
                                    'Mother',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: GREY.withOpacity(0.9)),
                                  ),
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: AppColors.mainColor,
                                  ),
                                  buttonHeight: 55.h,
                                  buttonPadding: const EdgeInsets.only(
                                      left: 20, right: 10),
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  items: relation
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
                                      return 'Please select a relationship.';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    family = value.toString();
                                  },
                                  onSaved: (value) {
                                    selectedValue = value.toString();
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 12.0),
                                  child: CustomText(
                                    text: 'Name',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                InputFormField(
                                  label: _phoneContact != null
                                      ? '${_phoneContact!.fullName}'
                                      : 'Jane Okafor',
                                  hintColor: _phoneContact != null
                                      ? BLACK
                                      : AppColors.laon3,
                                  readOnly: true,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 12.0),
                                  child: CustomText(
                                    text: 'Phone Number',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                InputFormField(
                                  label: _phoneContact != null
                                      ? '${_phoneContact!.phoneNumber!.number}'
                                      : '09064519907',
                                  hintColor: _phoneContact != null
                                      ? BLACK
                                      : AppColors.laon3,
                                  readOnly: true,
                                  suffixIcon: InkWell(
                                    onTap: () async {
                                      final PhoneContact contact =
                                          await FlutterContactPicker
                                              .pickPhoneContact();
                                      print(contact);
                                      setState(() {
                                        _phoneContact = contact;
                                      });
                                    },
                                    child: const Icon(
                                      Icons.phone_in_talk_outlined,
                                      color: AppColors.laon3,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.maxFinite,
                            decoration: const BoxDecoration(
                                color: AppColors.mainColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                )),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 14.0, bottom: 10.0),
                              child: Center(
                                  child: CustomText(
                                text: 'Colleague Contact',
                                color: WHITE,
                                fontSize: 16,
                              )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12, top: 12),
                            child: CustomText(
                                text:
                                    'In order to verify work status, you’re expected to\n'
                                    'add a co-worker number as a guaruntor.',
                                color: AppColors.laon3,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(27, 12, 27, 60),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: CustomText(
                                    text: 'Name',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                InputFormField(
                                  label: _colleagueContact != null
                                      ? '${_colleagueContact!.fullName}'
                                      : 'Jane Okafor',
                                  hintColor: _colleagueContact != null
                                      ? BLACK
                                      : AppColors.laon3,
                                  readOnly: true,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 12.0),
                                  child: CustomText(
                                    text: 'Phone Number',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                FormField<bool>(
                                  builder: (state) {
                                    return Column(
                                      children: [
                                        InputFormField(
                                          label: _colleagueContact != null
                                              ? '${_colleagueContact!.phoneNumber!.number}'
                                              : '09064519907',
                                          hintColor: _colleagueContact != null
                                              ? BLACK
                                              : AppColors.laon3,
                                          readOnly: true,
                                          suffixIcon: InkWell(
                                            onTap: () async {
                                              final PhoneContact contact =
                                                  await FlutterContactPicker
                                                      .pickPhoneContact();
                                              print(contact);
                                              setState(() {
                                                _colleagueContact = contact;
                                              });
                                            },
                                            child: const Icon(
                                              Icons.phone_in_talk_outlined,
                                              color: AppColors.laon3,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 5.h),
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
                                    if (_phoneContact!.phoneNumber!.number ==
                                        _colleagueContact!
                                            .phoneNumber!.number) {
                                      return 'Phone numbers cannot be the same';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ],
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
                          onPressed: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            if (_formKey.currentState!.validate()) {
                              // Family Contact
                              prefs.setString("relationship", family);
                              prefs.setString(
                                  "familyName", '${_phoneContact!.fullName}');
                              prefs.setString("familyPhone",
                                  '${_phoneContact!.phoneNumber!.number}');

                              // Colleague Contact
                              prefs.setString("colleagueName",
                                  '${_colleagueContact!.fullName}');
                              prefs.setString("colleaguePhone",
                                  '${_colleagueContact!.phoneNumber!.number}');

                              print(widget.workId);
                              print(widget.bankStatement);

                              Get.to(() => UploadPicture(
                                    workId: widget.workId,
                                    bankStatement: widget.bankStatement,
                                  ));
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
