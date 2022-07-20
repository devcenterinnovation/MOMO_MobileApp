import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momo/constants.dart';
import 'package:momo/controllers/user_controller.dart';
import 'package:momo/custom_text.dart';
import 'package:momo/input_field.dart';
import 'package:momo/theme.dart';
import 'package:momo/widgets/appbar.dart';

class UserBankDetails extends StatefulWidget {
  const UserBankDetails({Key? key}) : super(key: key);

  @override
  State<UserBankDetails> createState() => _UserBankDetailsState();
}

class _UserBankDetailsState extends State<UserBankDetails> {
  String bankAccount = '';

  String bankName = '';

  String accountName = '';

  UserController userController = Get.find();

  @override
  initState() {
    bankName = userController.getProfile()!.bankDetails.bankName;
    bankAccount = userController.getProfile()!.bankDetails.accountNumber;
    accountName = userController.getProfile()!.bankDetails.accountName;

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
                        label: bankAccount,
                        hintColor: BLACK,
                        hintSize: 16.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: CustomText(
                          text: 'Bank Name',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      InputFormField(
                        label: bankName,
                        hintSize: 16.0,
                        hintColor: BLACK,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: CustomText(
                          text: 'Account Name',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      InputFormField(
                        label: accountName,
                        hintSize: 16.0,
                        hintColor: BLACK,
                      ),
                      SizedBox(height: 30.h)
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
