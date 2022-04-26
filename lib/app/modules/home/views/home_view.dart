import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_land/app/config/constants/app_constant.dart';
import 'package:movies_land/app/config/themes/app_theme.dart';
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
          HeaderBar(title: AppMessage.appTitle),

          /// TODO : Body
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
                    if (snapshot.hasError) {
                    } else if (snapshot.hasData) {
                      final int itemCount = snapshot.data!.docs.length * 5;
                      return PageView.builder(
                        padEnds: false,
                        physics: const BouncingScrollPhysics(),
                        controller: PageController(viewportFraction: .75, initialPage: 0),
                        itemCount: itemCount,
                        onPageChanged: (index) {
                          setState(() => {pageIndex = index});
                        },
                        itemBuilder: (_, i) {
                          final Map<String, dynamic> data = snapshot.data!.docs[0].data() as Map<String, dynamic>;
                          final Movies movie = Movies.fromMap(data);
                          final bool state = pageIndex == i;
                          return MovieShape(movie: movie, state: state);
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
  final bool state;
  const MovieShape({Key? key, required this.movie, this.state = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double margin = 10;
    return AnimatedContainer(
      duration: AppConstant.durationAnimation,
      curve: AppConstant.curve,
      margin: EdgeInsets.only(
        left: margin,
        right: margin,
        top: margin,
        bottom: state ? margin : margin * 5,
      ),
      decoration: BoxDecoration(
        color: AppTheme.primaryBackColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [AppConstant.boxShadow],
        image: DecorationImage(
          fit: BoxFit.cover,
          image: CachedNetworkImageProvider("${movie.photo}"),
        ),
      ),
      // child: EmptyBox(label: "${movie.id}"),
    );
  }
}
