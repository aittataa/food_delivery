import "package:cloud_firestore/cloud_firestore.dart";
import "package:get/get.dart";

import "../../../data/models/movies.dart";

class AdminProvider extends GetConnect {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final String _movies = "movies";
  late CollectionReference _collectionMovies;

  @override
  void onInit() {
    _collectionMovies = _fireStore.collection(_movies);
  }

  Stream<QuerySnapshot> get getMovies {
    final Stream<QuerySnapshot> response = _collectionMovies.snapshots();
    return response;
  }

  Stream<QuerySnapshot> getMovie(String id) {
    final Stream<QuerySnapshot> response = _collectionMovies.where("id", isEqualTo: id).snapshots();
    return response;
  }

  Future<Movies> getMoviesCollection(String id) async {
    return await _collectionMovies.doc(id).get().then((DocumentSnapshot<Object?> snapshot) {
      final Map<String, dynamic> response = snapshot.data() as Map<String, dynamic>;
      return Movies.fromMap(response);
    });
  }

  Future<Movies> createMoviesCollection(Movies movie) async {
    movie.id = _collectionMovies.doc().id;
    return await _collectionMovies.doc(movie.id).set(movie.toMap()).then((_) async {
      return await getMoviesCollection(movie.id!);
    });
  }

  Future<Movies> updateMoviesCollection(Movies movie) async {
    return await _collectionMovies.doc(movie.id).update(movie.toMap()).then((_) async {
      return await getMoviesCollection(movie.id!);
    });
  }

  Future<String> deleteMoviesCollection(String id) async {
    return await _collectionMovies.doc(id).delete().then((_) async {
      return "Deleted Successfully";
    });
  }
}
