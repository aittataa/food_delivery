import 'package:flutter/material.dart';

import '../../../config/constants/app_constant.dart';
import '../../../config/themes/app_theme.dart';

class TextBox extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;

  const TextBox({
    Key? key,
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: FocusNode(),
      controller: controller,
      cursorColor: AppTheme.mainColor,
      style: TextStyle(
        color: AppTheme.secondaryTextColor.withOpacity(.75),
        fontWeight: FontWeight.w900,
      ),
      scrollPadding: EdgeInsets.zero,
      maxLines: maxLines,
      // textInputAction: TextInputAction.done,
      // keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppTheme.textColor,
          fontWeight: FontWeight.bold,
        ),
        border: AppConstant.inputBorder,
        enabledBorder: AppConstant.inputBorder,
        focusedBorder: AppConstant.inputBorder,
        contentPadding: EdgeInsets.only(left: 25, right: 25, top: 20, bottom: 10),
      ),
    );
  }
}
