import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/common_use.dart';
import 'package:weather_app/core/utils/styles.dart';
import 'package:weather_app/features/home/data/models/weather_model.dart';

class WeatherData extends StatelessWidget {
  const WeatherData({
    super.key,
    required this.weather,
  });

  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: 70,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text.rich(
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              TextSpan(style: Styles.textStyle28, children: [
                const WidgetSpan(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 4.0, right: 4),
                    child: Icon(
                      Icons.place,
                      color: Colors.yellow,
                    ),
                  ),
                ),
                TextSpan(
                  text: '${weather.location!.country!}, ',
                ),
                TextSpan(
                  text: weather.location!.name!,
                ),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              getWeatherIconUrl(
                  weather.forecast!.forecastday![0].day!.condition!.code),
              height: 130,
            ),
          ),
          //  CustomCachedNetworkImage(
          //     icon:
          //         weather.forecast!.forecastday![0].day!.condition!.icon!),
          Text(
            '${weather.forecast!.forecastday![0].day!.avgtempC!.round().toString()}°',
            style: Styles.textStyle34,
          ),
          Text.rich(TextSpan(style: Styles.textStyle20, children: [
            const TextSpan(
              text: 'H: ',
            ),
            TextSpan(
              text:
                  '${weather.forecast!.forecastday![0].day!.maxtempC!.round().toString()}°',
            ),
            const TextSpan(
              text: '        L: ',
            ),
            TextSpan(
              text:
                  '${weather.forecast!.forecastday![0].day!.mintempC!.round().toString()}°',
            ),
          ])),
          Text(
            weather.forecast!.forecastday![0].day!.condition!.text!,
            style: Styles.textStyle24,
          ),
        ],
      ),
    );
  }
}
