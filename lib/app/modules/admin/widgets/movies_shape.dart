import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../config/constants/app_constant.dart';
import '../../../config/themes/app_theme.dart';
import '../../../data/models/movies.dart';
import '../../../shared/bounce_point.dart';

class MovieShape extends StatelessWidget {
  final Movies movie;
  const MovieShape({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: AppConstant.durationAnimation,
      curve: AppConstant.curve,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppTheme.primaryBackColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [AppConstant.boxShadow],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: CachedNetworkImage(
          imageUrl: "${movie.photo}",
          fit: BoxFit.cover,
          placeholder: (context, url) => BouncePoint(state: true, size: 25),
          errorWidget: (context, url, error) => Icon(IconlyBold.danger, color: AppTheme.redColor),
        ),
      ),
      // child: EmptyBox(label: "${movie.id}"),
    );
  }
}
