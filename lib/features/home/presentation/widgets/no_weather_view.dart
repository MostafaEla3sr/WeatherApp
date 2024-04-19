import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:weather_app/core/resources/assets_manager.dart';
import 'package:weather_app/core/utils/styles.dart';
import 'package:weather_app/features/search/presentation/views/search_view.dart';

class NoWeatherView extends StatelessWidget {
  const NoWeatherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            color: const Color(0xff232444),
            AppAssets.darkBg,
            fit: BoxFit.fitWidth,
            width: MediaQuery.sizeOf(context).width,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(AppAssets.search),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'There is no weather, start searching now...',
                  style: Styles.textStyle20,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            type: PageTransitionType.bottomToTop,
                            alignment: Alignment.center,
                            duration: const Duration(milliseconds: 1500),
                            child: const SearchView()));

                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black38,
                              spreadRadius: 0,
                              blurRadius: 5,
                              offset: Offset(2, 3))
                        ],
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xff383760),
                            const Color(0xff383760).withOpacity(0.5),
                          ],
                        ),
                        color: const Color(0xff383760),
                        border:
                            Border.all(color: Colors.white.withOpacity(0.2)),
                        borderRadius: BorderRadius.circular(30)),
                    height: 40,
                    width: MediaQuery.sizeOf(context).width,
                    child: const Center(
                      child: Text(
                        'Search Weather',
                        style: Styles.textStyle20,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
