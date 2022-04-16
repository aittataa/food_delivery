import 'package:flutter/material.dart';

import '../config/themes/app_theme.dart';

class EmptyBox extends StatelessWidget {
  const EmptyBox({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "No Data Found",
        style: TextStyle(
          color: AppTheme.mainColor.withOpacity(.25),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
