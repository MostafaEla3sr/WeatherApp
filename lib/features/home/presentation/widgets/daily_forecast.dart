import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/app_colors.dart';
import 'package:weather_app/core/widgets/back_arrow.dart';
import 'package:weather_app/features/home/data/models/forecast_day.dart';
import 'package:weather_app/features/home/presentation/widgets/daily_forcast_iem_list.dart';

class DailyForecast extends StatelessWidget {
  const DailyForecast({Key? key, required this.forecastDaysList})
      : super(key: key);
  final List<Forecastday> forecastDaysList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Stack(
        children: [
          const BackArrow(),
          Positioned(
            top: 100,
            bottom: 0,
            left: 0,
            right: 0,
            child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                itemBuilder: (context, index) =>
                    DailyForecastItemList(forecastDay: forecastDaysList[index]),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                itemCount: forecastDaysList.length),
          ),
        ],
      ),
    );
  }
}
