import "package:flutter/material.dart";

import "../config/constants/app_constant.dart";
import "../config/themes/app_theme.dart";

class LabelText extends StatelessWidget {
  final TextEditingController? controller;
  final bool expand;
  final validator;
  const LabelText({
    Key? key,
    this.controller,
    this.expand = true,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      style: const TextStyle(
        color: AppTheme.textColor,
        fontWeight: FontWeight.bold,
        letterSpacing: .5,
        fontSize: 15,
        overflow: TextOverflow.ellipsis,
      ),
      keyboardType: expand ? TextInputType.multiline : TextInputType.none,
      maxLines: expand ? null : 1,
      readOnly: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      scrollPadding: EdgeInsets.zero,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 5),
        border: AppConstant.inputBorder,
      ),
    );
  }
}
