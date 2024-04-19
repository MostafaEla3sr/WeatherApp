import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.icon,
    this.width = 140,
    this.height = 140,
    this.fitNum = 0,
  });

  final String icon;
  final double width, height;

  final int fitNum;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: 'https:$icon',
      height: width,
      width: height,
      fit: BoxFit.values[fitNum],
    );
  }
}
