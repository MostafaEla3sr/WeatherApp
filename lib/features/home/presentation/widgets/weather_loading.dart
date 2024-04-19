import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/core/resources/assets_manager.dart';

class WeatherLoading extends StatelessWidget {
  const WeatherLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Lottie.asset(AppAssets.search2));
  }
}
