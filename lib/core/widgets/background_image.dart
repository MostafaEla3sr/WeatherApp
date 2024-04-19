import 'package:flutter/material.dart';
import 'package:weather_app/core/resources/assets_manager.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Image.asset(
      AppAssets.darkBg,
      fit: BoxFit.cover
      ,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
    );
  }
}
