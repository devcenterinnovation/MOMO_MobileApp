import 'package:flutter/material.dart';
import 'package:momo/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'theme.dart';

class InputFormField extends StatelessWidget {
  const InputFormField({
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.obscure = false,
    this.onChanged,
    this.onSaved,
    this.enabled = true,
    this.controller,
    this.label,
    this.hint,
    this.hintSize,
    this.hintColor,
    this.maxLength,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType,
    this.maxLines = 1,
    this.readOnly = false,
    this.onTap,
    this.inputFormatters,
  });

  final suffixIcon;
  final prefixIcon;
  final onChanged;
  final onSaved;
  final validator;
  final maxLength;
  final enabled;
  final controller;
  final obscure;
  final label;
  final hint;
  final hintSize;
  final hintColor;
  final textCapitalization;
  final keyboardType;
  final maxLines;
  final readOnly;
  final onTap;
  final inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
      child: TextFormField(
        inputFormatters: inputFormatters,
        buildCounter: (context,
                {required currentLength, required isFocused, maxLength}) =>
            null,
        maxLength: maxLength,
        maxLines: maxLines,
        enabled: enabled,
        controller: controller,
        keyboardType: keyboardType,
        style: TextStyle(fontSize: 14.sp, color: BLACK.withOpacity(0.9)),
        validator: validator,
        onChanged: onChanged,
        onSaved: onSaved,
        onTap: onTap,
        readOnly: readOnly,
        obscureText: obscure,
        decoration: buildInputDecoration(
            hint: label,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintSize: hintSize,
            hintColor: hintColor),
      ),
    );
  }
}

InputDecoration buildInputDecoration(
    {hint,
    label,
    prefixIcon,
    suffixIcon,
    hintSize = 14,
    hintColor = AppColors.laon3}) {
  return InputDecoration(
    // filled: filled,
    // fillColor: PRIMARY.withOpacity(0.8),
    border: InputBorder.none,
    enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.mainColor, width: 0.7),
        borderRadius: BorderRadius.all(Radius.circular(8))),
    disabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.mainColor, width: 0.7),
        borderRadius: BorderRadius.all(Radius.circular(8))),
    focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.mainColor, width: 0.7),
        borderRadius: BorderRadius.all(Radius.circular(8))),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: Colors.redAccent, width: 0.7),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: AppColors.mainColor, width: 0.7),
    ),
    suffixIcon: suffixIcon,
    prefixIcon: prefixIcon,
    labelText: label,
    hintText: hint,
    labelStyle: TextStyle(fontSize: 14.sp, color: GREY.withOpacity(0.9)),
    hintStyle: TextStyle(fontSize: hintSize, color: hintColor),
    contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
  );
}

InputDecoration buildChatDecoration({hint}) {
  return InputDecoration(
    border: InputBorder.none,
    enabledBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
    focusedBorder: InputBorder.none,
    errorBorder: InputBorder.none,
    focusedErrorBorder: InputBorder.none,
    hintText: hint,
    hintStyle: TextStyle(fontSize: 14.sp, color: GREY.withOpacity(0.9)),
    contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
  );
}
