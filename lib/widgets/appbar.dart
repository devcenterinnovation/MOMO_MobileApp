import 'package:flutter/material.dart';
import 'package:momo/constants.dart';
import 'package:momo/custom_text.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    this.text,
    this.textColor,
    this.iconColor,
    this.backgroundColor = AppColors.appbarColor,
    this.spacing = 20.0,
  });
  final text;
  final textColor;
  final iconColor;
  final spacing;
  final backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Row(
            children: [
              // GestureDetector(
              //   onTap: () => Get.back(),
              //   child: Icon(
              //     Icons.arrow_back_rounded,
              //     color: iconColor,
              //   ),
              // ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: text,
                      color: textColor,
                    ),
                    SizedBox(width: spacing),
                    Image.asset(
                        'assets/images/emojione-v1_pen-over-stamped-envelope.png')
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
