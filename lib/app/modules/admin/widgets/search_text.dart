import "package:flutter/material.dart";

import "../../../config/constants/app_constant.dart";
import "../../../config/themes/app_theme.dart";

class SearchText extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  const SearchText({Key? key, this.controller, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      cursorColor: AppTheme.mainColor,
      style: TextStyle(
        color: AppTheme.secondaryTextColor.withOpacity(.75),
        fontWeight: FontWeight.w900,
      ),
      scrollPadding: EdgeInsets.zero,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        prefixIcon: const Icon(Icons.search, color: AppTheme.mainColor),
        hintText: "Search...",
        hintStyle: const TextStyle(
          color: AppTheme.textColor,
          fontWeight: FontWeight.bold,
        ),
        border: AppConstant.inputBorder,
        enabledBorder: AppConstant.inputBorder,
        focusedBorder: AppConstant.inputBorder,
      ),
    );
  }
}
