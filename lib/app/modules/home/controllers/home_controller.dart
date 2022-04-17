import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../data/data_sources/remote/remote_data_sources.dart';

class HomeController extends GetxController {
  final RemoteDataSources _remoteData = Get.put(RemoteDataSources());

  @override
  void onInit() {
    super.onInit();
  }

  Stream<QuerySnapshot> get getMovies {
    final Stream<QuerySnapshot> response = _remoteData.getMovies;
    return response;
  }
}
