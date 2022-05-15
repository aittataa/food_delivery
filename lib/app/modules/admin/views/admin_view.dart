import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/functions/app_function.dart';
import '../../../config/messages/app_message.dart';
import '../../../config/themes/app_theme.dart';
import '../../../data/models/movies.dart';
import '../../../shared/bounce_point.dart';
import '../../../shared/empty_box.dart';
import '../../../shared/radio_box.dart';
import '../controllers/admin_controller.dart';
import '../widgets/button_click.dart';
import '../widgets/icons_button.dart';
import '../widgets/movies_shape.dart';
import '../widgets/search_text.dart';
import '../widgets/text_box.dart';

class AdminView extends StatefulWidget {
  const AdminView({Key? key}) : super(key: key);
  @override
  State<AdminView> createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {
  final AdminController controller = Get.put(AdminController());
  late Stream<QuerySnapshot> _stream = controller.getMovies;
  final TextEditingController description = TextEditingController();

  late int typeIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.backColor,
      child: LayoutBuilder(builder: (context, constraints) {
        late int crossAxisCount = 5;
        if (constraints.constrainWidth() < 600) {
          crossAxisCount = 1;
        } else if (constraints.constrainWidth() < 900) {
          crossAxisCount = 2;
        } else if (constraints.constrainWidth() < 1200) {
          crossAxisCount = 3;
        } else if (constraints.constrainWidth() < 1500) {
          crossAxisCount = 4;
        } else {
          crossAxisCount = 5;
        }
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Header(),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.all(20),
                      title: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 300,
                            child: SearchText(),
                          ),
                        ],
                      ),
                      trailing: ButtonClick(
                        label: "Add New Movie",
                        onPressed: () {
                          print(constraints.maxWidth);
                        },
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 500,
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: 25),
                              title: TextBox(
                                controller: TextEditingController(),
                                hintText: "Title",
                              ),
                            ),
                          ),
                          Container(
                            width: 500,
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: 25),
                              title: TextBox(
                                controller: description,
                                maxLines: 10,
                                hintText: 'Type a description...',
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 500,
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: 25),
                              title: TextBox(controller: TextEditingController(), hintText: "Type New Category"),
                              trailing: IconsButton(icon: CupertinoIcons.plus),
                            ),
                          ),
                          SizedBox(
                            width: 500,
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: 25),
                              title: TextBox(controller: TextEditingController(), hintText: "Type New Server"),
                              trailing: IconsButton(icon: CupertinoIcons.plus),
                            ),
                          ),
                          SizedBox(
                            width: 500,
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: 50),
                              leading: Text(
                                "Pick Type",
                                style: TextStyle(
                                  color: AppTheme.textColor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              title: Row(
                                children: [
                                  Expanded(child: SizedBox(width: 1)),
                                  RadioBox(
                                    state: typeIndex == 0,
                                    size: 25,
                                    onTap: () {
                                      setState(() => {typeIndex = 0});
                                    },
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      "Movie",
                                      style: TextStyle(
                                        color: AppTheme.textColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Expanded(child: SizedBox(width: 1)),
                                  RadioBox(
                                    state: typeIndex == 1,
                                    size: 25,
                                    onTap: () {
                                      setState(() => {typeIndex = 1});
                                    },
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      "Series",
                                      style: TextStyle(
                                        color: AppTheme.textColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Expanded(child: SizedBox(width: 1)),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 250,
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: 25),
                              title: ButtonClick(
                                label: "Save",
                                onPressed: () {
                                  print(constraints.maxWidth);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    StreamBuilder<QuerySnapshot>(
                      stream: _stream,
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return Center(child: BouncePoint());
                          case ConnectionState.none:
                            return EmptyBox(label: snapshot.error.toString());
                          case ConnectionState.active:
                            if (snapshot.hasError) {
                              return EmptyBox(label: snapshot.error.toString());
                            } else if (snapshot.hasData) {
                              final int itemCount = snapshot.data!.docs.length * 10;
                              return GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
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
                            return const EmptyBox();
                          case ConnectionState.done:
                            return EmptyBox(label: "Done");
                          default:
                            return EmptyBox(label: "default");
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      decoration: BoxDecoration(color: AppTheme.secondaryBackColor),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Image.asset(AppMessage.appIconRound),
        trailing: Image.asset(AppMessage.appLogo),
        title: Text(
          AppMessage.appTitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppTheme.primaryTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
