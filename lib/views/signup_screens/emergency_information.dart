import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momo/constants.dart';
import 'package:momo/custom_text.dart';
import 'package:momo/input_field.dart';
import 'package:momo/theme.dart';
import 'package:momo/views/signup_screens/upload_photo.dart';
import 'package:momo/widget.dart';
import 'package:momo/widgets/appbar.dart';

class EmergencyContact extends StatefulWidget {
  const EmergencyContact({Key? key}) : super(key: key);

  @override
  State<EmergencyContact> createState() => _EmergencyContactState();
}

class _EmergencyContactState extends State<EmergencyContact> {
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
                          offset:
                              const Offset(0, 5), // changes position of shadow
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
                            padding:
                                const EdgeInsets.only(top: 14.0, bottom: 10.0),
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
                              const InputFormField(
                                label: 'Mother',
                                suffixIcon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: AppColors.mainColor,
                                  size: 20,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: CustomText(
                                  text: 'Name',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const InputFormField(label: 'Jane Okafor'),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: CustomText(
                                  text: 'Phone Number',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const InputFormField(
                                label: '09064519907',
                                suffixIcon: Icon(
                                  Icons.phone_in_talk_outlined,
                                  color: AppColors.laon3,
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
                          offset:
                              const Offset(0, 5), // changes position of shadow
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
                            padding:
                                const EdgeInsets.only(top: 14.0, bottom: 10.0),
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
                              const InputFormField(label: 'Jane Okafor'),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: CustomText(
                                  text: 'Phone Number',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const InputFormField(
                                label: '09064519907',
                                suffixIcon: Icon(
                                  Icons.phone_in_talk_outlined,
                                  color: AppColors.laon3,
                                ),
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
                        onPressed: () => Get.to(() => const UploadPicture())),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
