import 'package:flutter/material.dart';

import '../../../config/constants/app_constant.dart';
import '../../../config/themes/app_theme.dart';

class EditText extends StatelessWidget {
  final TextEditingController? controller;
  final bool enable;
  final String? hintText;
  final double? fontSize;
  final int? maxLines;
  final Widget? suffixIcon;
  final validator;
  final Function()? onTap;
  final Function(String)? onChanged;
  const EditText({
    Key? key,
    this.controller,
    this.enable = true,
    this.hintText,
    this.fontSize = 14,
    this.maxLines = 1,
    this.suffixIcon,
    this.validator,
    this.onTap,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onTap: onTap,
      onChanged: onChanged,
      style: TextStyle(
        color: AppTheme.secondaryTextColor.withOpacity(.65),
        fontWeight: FontWeight.bold,
        letterSpacing: .5,
        fontSize: fontSize,
      ),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      cursorColor: AppTheme.mainColor,
      scrollPadding: EdgeInsets.zero,
      readOnly: !enable,
      maxLines: maxLines,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.all(10).copyWith(right: 0),
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppTheme.mainColor.withOpacity(.25),
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        filled: true,
        fillColor: AppTheme.mainColor.withOpacity(.1),
        border: AppConstant.inputBorder,
        disabledBorder: AppConstant.inputBorder,
        focusedErrorBorder: AppConstant.inputBorder,
        focusedBorder: AppConstant.inputBorder,
        enabledBorder: AppConstant.inputBorder,
        errorBorder: AppConstant.inputBorder,
      ),
    );
  }
}
