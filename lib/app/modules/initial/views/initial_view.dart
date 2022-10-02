import "package:flutter/material.dart";
import "../../categories/views/categories_view.dart";
import "../../home/views/home_view.dart";
import "../../search/views/search_view.dart";
import "../../settings/views/settings_view.dart";
import "../widgets/footer_bar.dart";

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
          const HomeView(),
          SearchView(),
          CategoriesView(),
          SettingsView(),
        ],
      ),
      bottomNavigationBar: FooterBar(
        index: _index,
        onTap: (int index) {
          setState(() => {_index = index});
          _controller.jumpToPage(_index);
        },
      ),
    );
  }
}
