import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../config/constants/app_constant.dart';
import '../../../config/themes/app_theme.dart';
import '../../../data/models/movies.dart';

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
