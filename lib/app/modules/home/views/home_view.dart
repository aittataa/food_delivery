import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_land/app/config/constants/app_constant.dart';
import 'package:movies_land/app/modules/home/controllers/home_controller.dart';
import 'package:movies_land/app/shared/bounce_point.dart';
import 'package:movies_land/app/shared/empty_box.dart';
import 'package:movies_land/app/shared/floating_button.dart';

import '../../../config/messages/app_message.dart';
import '../../../data/models/movies.dart';
import '../../../shared/header_bar.dart';

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
          //setState(() => {stream = controller.getMovies});
        },
      ),
      body: ListView(
        children: [
          HeaderBar(title: AppMessage.appTitle),
          SizedBox(
            height: AppConstant.screenWidth,
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
                      return PageView.builder(
                        controller: PageController(viewportFraction: .75, initialPage: 0),
                        itemCount: 10,
                        //itemCount: snapshot.data!.docs.length,
                        itemBuilder: (_, i) {
                          final Map<String, dynamic> data = snapshot.data!.docs[0].data() as Map<String, dynamic>;
                          final Movies movie = Movies.fromMap(data);
                          //return EmptyBox(label: "${movie.id} $i");
                          return MovieShape(movie: movie);
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

class MovieShape extends StatelessWidget {
  final Movies movie;
  const MovieShape({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [AppConstant.boxShadow],
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage("${movie.photo}"),
        ),
      ),
      // child: EmptyBox(label: "${movie.id}"),
    );
  }
}
