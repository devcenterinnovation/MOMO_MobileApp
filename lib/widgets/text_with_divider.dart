import 'package:flutter/material.dart';
import 'package:momo/constants.dart';
import 'package:momo/custom_text.dart';

class TextWithDivider extends StatelessWidget {
  const TextWithDivider({
    this.text,
    this.icon,
    this.onTap,
  });
  final text;
  final icon;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 45.0),
          child: GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                Icon(
                  icon,
                  color: AppColors.laon3,
                ),
                const SizedBox(width: 22),
                CustomText(text: text)
              ],
            ),
          ),
        ),
        const Divider(color: AppColors.grey4)
      ],
    );
  }
}
