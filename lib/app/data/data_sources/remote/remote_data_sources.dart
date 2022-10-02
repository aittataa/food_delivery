import "package:cloud_firestore/cloud_firestore.dart";
import "package:get/get.dart";

class RemoteDataSources extends GetConnect {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  final String _movies = "movies";

  late CollectionReference _collectionMovies;

  @override
  void onInit() async {
    _collectionMovies = _fireStore.collection(_movies);
  }

  Stream<QuerySnapshot> get getMovies {
    final Stream<QuerySnapshot> response = _collectionMovies.snapshots();
    return response;
  }
}
