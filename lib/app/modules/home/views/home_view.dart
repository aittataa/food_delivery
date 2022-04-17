import 'package:flutter/material.dart';
import 'package:movies_land/app/shared/header_bar.dart';

import '../../../config/messages/app_message.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HeaderBar(title: AppMessage.appTitle),
          SafeArea(
            child: ListView(
              children: [
                ListTile(),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 50,
                  itemBuilder: (_, i) {
                    return Text("$i");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
