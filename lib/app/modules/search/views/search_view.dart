import 'package:flutter/material.dart';

import '../../../config/messages/app_message.dart';
import '../../../shared/floating_button.dart';
import '../../../shared/header_bar.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HeaderBar(title: AppMessage.appTitle),
        ],
      ),
      floatingActionButton: FloatingButton(
        icon: Icons.search,
        onPress: () async {},
      ),
    );
  }
}
