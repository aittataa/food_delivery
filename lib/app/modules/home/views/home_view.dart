import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_land/app/modules/home/controllers/home_controller.dart';
import 'package:movies_land/app/shared/bounce_point.dart';
import 'package:movies_land/app/shared/empty_box.dart';
import 'package:movies_land/app/shared/floating_button.dart';
import 'package:movies_land/app/shared/header_bar.dart';

import '../../../config/messages/app_message.dart';
import '../../../data/models/movies.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController controller = Get.put(HomeController());
  late Stream<QuerySnapshot> stream = controller.getMovies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingButton(
        icon: CupertinoIcons.refresh,
        onPress: () {
          setState(() => {stream = controller.getMovies});
        },
      ),
      body: Column(
        children: [
          HeaderBar(title: AppMessage.appTitle),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: stream,
              builder: (_, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return BouncePoint();
                  case ConnectionState.none:
                    return EmptyBox(label: snapshot.error.toString());
                  case ConnectionState.active:
                    if (snapshot.hasData) {
                      //final Map<String, dynamic> data = snapshot.data!.docs.first.data() as Map<String, dynamic>
                      //final List<Movie> movies = moviesFromJson(data);
                      //print(data);
                      return PageView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (_, i) {
                          final Map<String, dynamic> data = snapshot.data!.docs[i].data() as Map<String, dynamic>;
                          final Movies movie = Movies.fromMap(data);
                          // return EmptyBox(label: "${data}");
                          // return EmptyBox(label: "${data['name']}");
                          return EmptyBox(label: "${movie.id}");
                        },
                      );
                    }
                    return EmptyBox();
                  case ConnectionState.done:
                    return EmptyBox(label: "Done");
                  default:
                    return const SizedBox();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
