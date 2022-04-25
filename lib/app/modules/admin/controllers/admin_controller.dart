import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:movies_land/app/modules/admin/providers/admin_provider.dart';

import '../../../data/models/movies.dart';

class AdminController extends GetxController {
  final AdminProvider _provider = Get.put(AdminProvider());

  @override
  void onInit() {
    super.onInit();
  }

  Stream<QuerySnapshot> get getMovies {
    final Stream<QuerySnapshot> response = _provider.getMovies;
    return response;
  }

  Stream<QuerySnapshot> getMovie(String id) {
    final Stream<QuerySnapshot> response = _provider.getMovie(id);
    return response;
  }

  Future<Movies> getMoviesCollection(String id) async {
    final Movies response = await _provider.getMoviesCollection(id);
    return response;
  }

  Future<Movies> createMoviesCollection(Movies movie) async {
    final Movies response = await _provider.createMoviesCollection(movie);
    return response;
  }

  Future<Movies> updateMoviesCollection(Movies movie) async {
    final Movies response = await _provider.updateMoviesCollection(movie);
    return response;
  }

  Future<String> deleteMoviesCollection(String id) async {
    final String response = await _provider.deleteMoviesCollection(id);
    return response;
  }
}
