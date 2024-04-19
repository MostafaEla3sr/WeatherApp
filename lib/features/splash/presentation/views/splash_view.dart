import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:weather_app/core/resources/assets_manager.dart';
import 'package:weather_app/features/home/presentation/views/home_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  Future<void> _checkUserAndNavigate(BuildContext context) async {
    await Future.delayed(
      const Duration(
        seconds: 5,
      ),
    );
    Navigator.pushReplacement(
        context,
        PageTransition(
            type: PageTransitionType.size,
            alignment: Alignment.center,
            duration: const Duration(milliseconds: 1500),
            child: const HomeView()));
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage(AppAssets.bottomSheetBg), context);
    precacheImage(const AssetImage(AppAssets.darkBg), context);
    precacheImage(const AssetImage(AppAssets.noWeather), context);
    precacheImage(const AssetImage(AppAssets.tabBar), context);
    precacheImage(const AssetImage(AppAssets.sun), context);
    return FutureBuilder(
        future: _checkUserAndNavigate(context),
        builder: (context, snapshot) {
          return Scaffold(
            body: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                    fit: BoxFit.fitWidth,
                    width: MediaQuery.sizeOf(context).width,
                    AppAssets.darkBg),
                Lottie.asset(AppAssets.splash),
              ],
            ),
          );
        });
  }
}
