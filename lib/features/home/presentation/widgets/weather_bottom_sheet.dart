import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:weather_app/core/resources/assets_manager.dart';
import 'package:weather_app/core/utils/app_colors.dart';
import 'package:weather_app/core/utils/styles.dart';
import 'package:weather_app/features/home/data/models/weather_model.dart';
import 'package:weather_app/features/home/presentation/widgets/daily_forecast.dart';
import 'package:weather_app/features/home/presentation/widgets/hourly_forecast_item.dart';
import 'package:weather_app/features/search/presentation/views/search_view.dart';

class WeatherBottomSheet extends StatelessWidget {
  const WeatherBottomSheet({Key? key, required this.weather}) : super(key: key);
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage(AppAssets.bottomSheetBg), context);

    return Positioned(
      top: 380,
      left: 0,
      right: 0,
      bottom: -8,
      child: Stack(
        children: [
          Image.asset(
            fit: BoxFit.fill,
            AppAssets.bottomSheetBg,
            height: 500,
            width: MediaQuery.sizeOf(context).width,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 6,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(6)),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Hourly Forecast',
                    style: Styles.textStyle16.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Opacity(
                    opacity: 0.5,
                    child: Image.asset(
                      AppAssets.divider,
                    ),
                  ),
                  SizedBox(
                    height: 190,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 8,
                        ),
                        itemCount: weather.forecast!.forecastday![0].hour!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => HourlyForecastItem(
                            hour: weather.forecast!.forecastday![0].hour![index]),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                alignment: Alignment.center,
                                duration: const Duration(milliseconds: 500),
                                child: DailyForecast(
                                    forecastDaysList:
                                        weather.forecast!.forecastday!)));
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => DailyForecast(
                        //           forecastDaysList:
                        //               weather.forecast!.forecastday!),
                        //     ));
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
                        height: 50,
                        width: MediaQuery.sizeOf(context).width,
                        child: const Center(
                          child: Text(
                            'Show Daily Forecast',
                            style: Styles.textStyle20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  AppAssets.tabBar,
                ),
                Positioned(
                  bottom: 32,
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.bottomToTop,
                                alignment: Alignment.center,
                                duration: const Duration(milliseconds: 500),
                                child: const SearchView()));
                      },
                      icon: const Icon(
                        Icons.search,
                        size: 34,
                        color: AppColors.primaryColor,
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
