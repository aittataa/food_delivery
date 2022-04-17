import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_land/app/modules/categories/views/categories_view.dart';
import 'package:movies_land/app/modules/home/views/home_view.dart';
import 'package:movies_land/app/modules/search/views/search_view.dart';
import 'package:movies_land/app/modules/settings/views/settings_view.dart';

import '../../home/widgets/footer_bar.dart';

class InitialView extends StatefulWidget {
  const InitialView({Key? key}) : super(key: key);
  @override
  State<InitialView> createState() => _InitialViewState();
}

class _InitialViewState extends State<InitialView> {
  late PageController _controller = PageController();
  late int _index;
  @override
  void initState() {
    super.initState();
    _index = 0;
    _controller = PageController(initialPage: _index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [
          HomeView(),
          SearchView(),
          CategoriesView(),
          SettingsView(),
        ],
      ),
      bottomNavigationBar: FooterBar(
        index: _index,
        onTap: (index) {
          setState(() => {_index = index});
          _controller.jumpToPage(_index);
        },
      ),
    );
  }
}
