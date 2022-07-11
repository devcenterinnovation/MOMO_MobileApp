import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momo/input_field.dart';
import 'package:momo/validator.dart';
import 'package:momo/views/signup_screens/onboarding_screens.dart';
import 'package:momo/widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({Key? key}) : super(key: key);

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  final passwordController = TextEditingController();

  bool _obscureText = true;
  bool _obscureText2 = true;


  toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  toggle2() {
    setState(() {
      _obscureText2 = !_obscureText2;
    });
  }

  String _password = "";

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                Center(
                  child: SizedBox(
                      height: 68,
                      width: 69,
                      child: Image.asset('assets/images/Momo logo 1.png')),
                ),
                const SizedBox(height: 12),
                const Center(
                  child: Text(
                    'Create A 6 Digit Password',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 44),
                Padding(
                  padding: const EdgeInsets.only(left: 35.0, right: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Password',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      InputFormField(
                        label: '*****************',
                        obscure: _obscureText,
                        onChanged: (val) {
                          setState(() => _password = val);
                        },
                        validator: (v) => PasswordValidator.validatePassword(v),
                        suffixIcon: InkWell(
                            onTap: toggle,
                            child: Icon(_obscureText
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined)),
                      ),
                      const SizedBox(height: 14),
                      const Text(
                        'Confirm Password',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      InputFormField(
                        label: '*****************',
                        obscure: _obscureText2,
                        controller: passwordController,
                        onChanged: (val) {},
                        validator: (v) {
                          if (v != _password) {
                            return "The passwords are not the same";
                          }
                        },
                        suffixIcon: InkWell(
                            onTap: toggle2,
                            child: Icon(_obscureText2
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined)),
                      ),
                      const SizedBox(height: 40),
                      customButton(
                          title: 'Continue',
                          onPressed: ()async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            if (_formKey.currentState!.validate()) {
                              prefs.setString(
                                  "password", passwordController.text);
                              Get.to(() => const WelcomeMemo());
                              _formKey.currentState!.save();
                            }
                          })
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}