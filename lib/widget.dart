import 'package:flutter/material.dart';
import 'package:momo/constants.dart';
import 'package:momo/theme.dart';

Widget defaultButton({onPressed, title, color, borderColor}) => Container(
      width: double.maxFinite,
      height: 55,
      margin: const EdgeInsets.symmetric(vertical: 7.0),
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: borderColor ?? Colors.transparent)),
        child: Text(
          title ?? '',
          style: TextStyle(
              color: borderColor == null ? WHITE : BLACK, fontSize: 12),
        ),
      ),
      decoration: BoxDecoration(
        color: color ?? AppColors.mainColor,
        borderRadius: BorderRadius.circular(5),
      ),
    );

Widget customButton({
  onPressed,
  title,
  textColor,
  color,
  borderColor,
  icon,
  curve = 10.0,
  fontSize = 14.0,
}) =>
    Container(
      width: double.maxFinite,
      height: 55,
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(curve),
            side: BorderSide(color: borderColor ?? Colors.transparent)),
        child: Text(
          title ?? '',
          style: TextStyle(
              color: textColor ?? WHITE,
              fontSize: fontSize,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700),
        ),
      ),
      decoration: BoxDecoration(
        color: color ?? AppColors.mainColor,
        borderRadius: BorderRadius.circular(5),
      ),
    );

Expanded customButtons(
    {onPressed, title, textColor, color, borderColor, icon}) {
  return Expanded(
      flex: 1,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 7.0),
        child: MaterialButton(
          onPressed: onPressed,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: borderColor ?? Colors.transparent)),
          child: Text(
            title ?? '',
            style: TextStyle(
                color: textColor ?? WHITE,
                fontSize: 12,
                fontWeight: FontWeight.w700),
          ),
        ),
        decoration: BoxDecoration(
          color: color ?? PRIMARY,
          borderRadius: BorderRadius.circular(5),
        ),
      ));
}

Widget customButtonWithIcon(
        {onPressed, title, textColor, color, borderColor, icon}) =>
    Container(
      width: double.infinity,
      height: 55,
      margin: const EdgeInsets.symmetric(vertical: 7.0),
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: borderColor ?? Colors.transparent)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 10),
            Text(
              title ?? '',
              style: TextStyle(
                  color: textColor ?? WHITE,
                  fontSize: 13,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: color ?? PRIMARY,
        borderRadius: BorderRadius.circular(5),
      ),
    );

Widget dialogButton({onPressed, title, color, borderColor}) => Container(
      width: double.infinity,
      height: 45,
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: borderColor ?? Colors.transparent)),
        child: Text(
          title,
          style: TextStyle(
              color: borderColor == null ? WHITE : BLACK, fontSize: 12),
        ),
      ),
      decoration: BoxDecoration(
        color: color ?? PRIMARY,
        borderRadius: BorderRadius.circular(5),
      ),
    );
