import 'package:flutter/material.dart';
import 'package:movies_land/app/shared/header_bar.dart';

import '../../../config/messages/app_message.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderBar(title: AppMessage.appTitle),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 50,
              itemBuilder: (_, i) {
                return Text("$i");
              },
            ),
          ),
        ],
      ),
    );
  }
}
