import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
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
        child: Icon(CupertinoIcons.add),
        onPressed: () async {
          print("hello");
          final FirebaseFirestore firestore = FirebaseFirestore.instance;
          final String _movies = "movies";
          late CollectionReference _collectionMovies = firestore.collection(_movies);
          final String id = _collectionMovies.doc().id;
          final response = await _collectionMovies.doc(id).set({
            'id': id,
            'name': "Game of thrones",
            'phone_number': "8 Seasons",
          }).then((_) async {
            return true;
          });
          print(response);
        },
      ),
    );
  }
}
