import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momo/constants.dart';
import 'package:momo/custom_text.dart';
import 'package:momo/input_field.dart';
import 'package:momo/theme.dart';
import 'package:momo/views/signup_screens/get_started.dart';
import 'package:momo/widget.dart';
import 'package:momo/widgets/appbar.dart';

class AddAccountDetails extends StatefulWidget {
  const AddAccountDetails({Key? key}) : super(key: key);

  @override
  State<AddAccountDetails> createState() => _AddAccountDetailsState();
}

class _AddAccountDetailsState extends State<AddAccountDetails> {
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
                      const InputFormField(label: '1001 09200 0199'),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: CustomText(
                          text: 'Bank Name',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const InputFormField(label: 'John do'),
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
                      onPressed: () => Get.to(() => const GetStarted())),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
