import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/core/resources/assets_manager.dart';
import 'package:weather_app/core/utils/app_colors.dart';
import 'package:weather_app/core/utils/common_use.dart';
import 'package:weather_app/core/utils/styles.dart';
import 'package:weather_app/features/home/data/models/forecast_day.dart';

class DailyForecastItemList extends StatelessWidget {
  const DailyForecastItemList({Key? key, required this.forecastDay})
      : super(key: key);

  final Forecastday forecastDay;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SvgPicture.asset(
          width: MediaQuery.sizeOf(context).width,
          AppAssets.dailyForecastBg,
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${forecastDay.day!.avgtempC!}°',
                style: Styles.textStyle50,
              ),
              Text.rich(TextSpan(
                  style: Styles.textStyle18Bold
                      .copyWith(color: AppColors.textColor),
                  children: [
                    const TextSpan(
                      text: 'H:',
                    ),
                    TextSpan(
                      text: '${forecastDay.day!.maxtempC}°',
                    ),
                    const TextSpan(
                      text: '  L:',
                    ),
                    TextSpan(
                      text: '${forecastDay.day!.mintempC}°',
                    ),
                  ])),
              const SizedBox(
                height: 12,
              ),
              Text(
                forecastDay.day!.condition!.text!,
                style: Styles.textStyle22Bold,
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          top: -10,
          child: Image.asset(
            getWeatherIconUrl(forecastDay.day!.condition!.code),
            height: 150,
          ),
        ),
        Positioned(
          right: 20,
          bottom: 20,
          child: Text(
            forecastDay.date!,
            style: Styles.textStyle16,
          ),
        ),
      ],
    );
  }
}
