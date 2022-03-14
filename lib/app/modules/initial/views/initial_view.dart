import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/initial_controller.dart';

class InitialView extends GetView<InitialController> {
  const InitialView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InitialView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'InitialView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
