import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          print("hello");
          final FirebaseFirestore firestore = FirebaseFirestore.instance;
          final String _movies = "movies";
          late CollectionReference _collectionMovies = firestore.collection(_movies);
          final String id = _collectionMovies.doc().id;
          await _collectionMovies.doc(id).set({"name", "ABDERRAHIM"}).then((_) async {
            return true;
          });
        },
      ),
    );
  }
}
