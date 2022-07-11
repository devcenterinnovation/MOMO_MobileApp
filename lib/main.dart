import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momo/constants.dart';
import 'package:momo/theme.dart';
import 'package:momo/views/signup_screens/onboarding_screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            title: 'Momo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: "Poppins",
              primaryColor: AppColors.mainColor,
              scaffoldBackgroundColor: WHITE,
            ),
            home: const OnboardingScreen(),
          );
        });
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3),
        () => Get.offAll(() => const SignupAndLogin()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Padding(
        padding: EdgeInsets.only(bottom: 150.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Image.asset('assets/images/Momo logo 1.png'),
              ),
            ),
            SizedBox(height: 40.h),
            Text(
              "Lend money, Easy and Fast",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
