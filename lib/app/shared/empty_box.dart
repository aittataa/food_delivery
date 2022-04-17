import 'package:flutter/material.dart';
import 'package:movies_land/app/config/messages/app_message.dart';

import '../config/themes/app_theme.dart';

class EmptyBox extends StatelessWidget {
  final String label;
  const EmptyBox({Key? key, this.label = AppMessage.labelNoDataFound}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "$label",
        style: TextStyle(
          color: AppTheme.mainColor.withOpacity(.25),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
