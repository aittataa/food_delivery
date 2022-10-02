import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../../config/constants/app_constant.dart";
import "../../../config/messages/app_message.dart";
import "../../../data/models/movies.dart";
import "../../../shared/bounce_point.dart";
import "../../../shared/empty_box.dart";
import "../../../shared/floating_button.dart";
import "../../../shared/header_bar.dart";
import "../controllers/home_controller.dart";
import "../widgets/movies_shape.dart";

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController controller = Get.put(HomeController());
  late Stream<QuerySnapshot> stream = controller.getMovies;
  late int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingButton(
        icon: CupertinoIcons.refresh,
        onPress: () {
          setState(() => {stream = controller.getMovies});
        },
      ),
      body: ListView(
        children: [
          /// TODO : AppBar
          const HeaderBar(title: AppMessage.appTitle),

          /// TODO : Body
          SizedBox(
            height: AppConstant.screenWidth,
            child: StreamBuilder<QuerySnapshot>(
              stream: stream,
              builder: (_, AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const BouncePoint();
                  case ConnectionState.none:
                    return EmptyBox(label: snapshot.error.toString());
                  case ConnectionState.active:
                    if (snapshot.hasError) {
                    } else if (snapshot.hasData) {
                      final int itemCount = snapshot.data!.docs.length * 5;
                      return PageView.builder(
                        padEnds: false,
                        physics: const BouncingScrollPhysics(),
                        controller: PageController(viewportFraction: .75, initialPage: 0),
                        itemCount: itemCount,
                        onPageChanged: (int index) {
                          setState(() => {pageIndex = index});
                        },
                        itemBuilder: (_, int i) {
                          final Map<String, dynamic> data = snapshot.data!.docs[0].data() as Map<String, dynamic>;
                          final Movies movie = Movies.fromMap(data);
                          final bool state = pageIndex == i;
                          return MovieShape(movie: movie, state: state);
                        },
                      );
                    }
                    return const EmptyBox();
                  case ConnectionState.done:
                    return const EmptyBox(label: "Done");
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
