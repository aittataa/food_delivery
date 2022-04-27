import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_land/app/config/constants/app_constant.dart';
import 'package:movies_land/app/config/functions/app_function.dart';
import 'package:movies_land/app/modules/admin/controllers/admin_controller.dart';

import '../../../config/messages/app_message.dart';
import '../../../config/themes/app_theme.dart';
import '../../../data/models/movies.dart';
import '../../../shared/bounce_point.dart';
import '../../../shared/empty_box.dart';

class AdminView extends StatefulWidget {
  const AdminView({Key? key}) : super(key: key);
  @override
  State<AdminView> createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {
  final AdminController controller = Get.put(AdminController());
  late Stream<QuerySnapshot> _stream = controller.getMovies;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.backColor,
      child: LayoutBuilder(builder: (context, constraints) {
        late int crossAxisCount = 5;
        if (constraints.constrainWidth() < 600) {
          crossAxisCount = 1;
        } else if (constraints.constrainWidth() < 800) {
          crossAxisCount = 2;
        } else if (constraints.constrainWidth() < 1000) {
          crossAxisCount = 3;
        } else if (constraints.constrainWidth() < 1200) {
          crossAxisCount = 4;
        } else if (constraints.constrainWidth() < 1400) {
          crossAxisCount = 5;
        }

        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                decoration: BoxDecoration(
                  color: AppTheme.secondaryBackColor,
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Image.asset(AppMessage.appIconRound),
                  title: Text(
                    AppMessage.appTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppTheme.primaryTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  trailing: Image.asset(
                    AppMessage.appLogo,
                  ),
                ),
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                    stream: _stream,
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return BouncePoint();
                        case ConnectionState.none:
                          return EmptyBox(label: snapshot.error.toString());
                        case ConnectionState.active:
                          if (snapshot.hasData) {
                            final int itemCount = snapshot.data!.docs.length;
                            return GridView.builder(
                              padding: EdgeInsets.all(50),
                              scrollDirection: Axis.vertical,
                              gridDelegate: AppFunction.gridDelegate(crossAxisCount: crossAxisCount, spacing: 50, childAspectRatio: 0.75),
                              itemCount: itemCount,
                              itemBuilder: (_, i) {
                                final Map<String, dynamic> data = snapshot.data!.docs[0].data() as Map<String, dynamic>;
                                final Movies movie = Movies.fromMap(data);
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
                    }),
              ),
            ],
          ),
        );
      }),
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
        color: AppTheme.primaryBackColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [AppConstant.boxShadow],
        // image: DecorationImage(
        //   fit: BoxFit.cover,
        //   image: CachedNetworkImageProvider("${movie.photo}"),
        // ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: CachedNetworkImage(
          imageUrl: "${movie.photo}",
          // fit: BoxFit.cover,
          placeholder: (context, url) => BouncePoint(state: true, size: 25),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
      // child: EmptyBox(label: "${movie.id}"),
    );
  }
}

/*class DashButton extends StatefulWidget {
  final IconData icon;
  final String title;
  final Function() onTap;
  const DashButton({Key? key, required this.icon, required this.title, required this.onTap}) : super(key: key);
  @override
  State<DashButton> createState() => _DashButtonState(icon, title, onTap);
}

class _DashButtonState extends State<DashButton> {
  final IconData icon;
  final String title;
  final Function() onTap;
  _DashButtonState(this.icon, this.title, this.onTap);
  late Color _textColor = AppTheme.textColor;
  late Color _iconColor = AppTheme.iconColor;
  late Color _backColor = AppTheme.transparentColor;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) {
        setState(() {});
        _textColor = AppTheme.primaryTextColor;
        _iconColor = AppTheme.primaryIconColor;
        _backColor = AppTheme.hoverColor;
      },
      onExit: (value) {
        setState(() {});
        _textColor = AppTheme.textColor;
        _iconColor = AppTheme.iconColor;
        _backColor = AppTheme.transparentColor;
      },
      child: ListTile(
        onTap: onTap,
        tileColor: _backColor,
        contentPadding: EdgeInsets.all(10),
        leading: Icon(icon, color: _iconColor),
        title: Text(title, style: TextStyle(color: _textColor)),
      ),
    );
  }
}*/

/*class MyList extends StatelessWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: AppTheme.appBarColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(flex: 1, child: SizedBox()),
          DashButton(icon: IconlyBold.category, title: "Dashboard", onTap: () {}),
          DashButton(icon: IconlyBold.ticket, title: "Movies", onTap: () {}),
          DashButton(icon: IconlyBold.setting, title: "Settings", onTap: () {}),
          Expanded(flex: 3, child: SizedBox()),
        ],
      ),
    );
  }
}*/
