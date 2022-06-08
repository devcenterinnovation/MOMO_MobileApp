import 'package:flutter/material.dart';
import 'package:momo/widgets/adaptive_text.dart';

class CustomText extends StatelessWidget {
  final Color? color;
  final Color? underlineColor;
  final String text;
  final FontWeight? fontWeight;
  double fontSize;
  TextOverflow overFlow;
  TextAlign textAlign;
  final TextDecoration? textDecoration;

  CustomText({
    Key? key,
    this.color,
    this.underlineColor,
    required this.text,
    this.textDecoration,
    this.fontWeight = FontWeight.w400,
    this.fontSize = 16.0,
    this.textAlign = TextAlign.left,
    this.overFlow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: AdaptiveTextSize().getadaptiveTextSize(context, fontSize),
        decoration: textDecoration,
        decorationColor: underlineColor,
        decorationThickness: 2,
      ),
    );
  }
}
