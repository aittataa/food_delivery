import 'package:flutter/material.dart';
import 'package:movies_land/app/shared/flexible_space.dart';

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
      appBar: AppBar(
        flexibleSpace: FlexibleSpace(),
      ),
      bottomNavigationBar: FooterBar(
        index: _index,
        onTap: (index) {
          setState(() => {_index = index});
          //_controller.jumpToPage(_index);
        },
      ),
    );
  }
}
