import 'package:flutter/material.dart';

import '../../../shared/floating_button.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingButton(
        icon: Icons.search,
        onPress: () async {},
      ),
    );
  }
}
