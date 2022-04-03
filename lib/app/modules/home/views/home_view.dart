import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final String assets = "https://vidhd.fun/embed-de4rxurqcch7.html";
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network("$assets")
      ..addListener(() => {setState(() {})})
      ..setLooping(true)
      ..initialize().then((_) => controller.play());
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: VideoPlayer(controller),
    );
  }
}
