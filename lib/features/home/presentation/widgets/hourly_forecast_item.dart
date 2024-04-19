import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/common_use.dart';
import 'package:weather_app/core/utils/styles.dart';
import 'package:weather_app/core/widgets/custom_cashed_network_image.dart';
import 'package:weather_app/features/home/data/models/hour.dart';

class HourlyForecastItem extends StatelessWidget {
  const HourlyForecastItem({
    super.key,
    required this.hour,
  });

  final Hour hour;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          border: Border.all(color: Colors.white.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(30)),
      height: 150,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Column(
          children: [
            Text.rich(TextSpan(style: Styles.textStyle16, children: [
              TextSpan(
                text: int.parse(hour.time!.substring(11, 13)) < 13
                    ? hour.time!.substring(11, 13)
                    : '${int.parse(hour.time!.substring(11, 13)) - 12}',
              ),
              TextSpan(
                text: int.parse(hour.time!.substring(11, 13)) < 12
                    ? ' AM'
                    : ' PM',
              ),
            ])),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Image.asset(
                getWeatherIconUrl(
                    hour.condition!.code),
                height: 30,
              ),
            ),
            // CustomCachedNetworkImage(
            //     width: 30, height: 30, icon: hour.condition!.icon!),
            const SizedBox(
              height: 12,
            ),
            Text('${hour.tempC!}°', style: Styles.textStyle20),
          ],
        ),
      ),
    );
  }
}
