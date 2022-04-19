import 'package:flutter/material.dart';

import '../../../config/messages/app_message.dart';
import '../../../shared/header_bar.dart';

class DetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HeaderBar(title: AppMessage.labelSearch),
        ],
      ),
    );
  }
}
