import 'package:flutter/material.dart';
import 'package:weather_app/core/widgets/background_image.dart';
import 'package:weather_app/features/home/data/models/weather_model.dart';
import 'package:weather_app/features/home/presentation/widgets/weather_bottom_sheet.dart';
import 'package:weather_app/features/home/presentation/widgets/weather_data.dart';
class WeatherViewBody extends StatelessWidget {
  const WeatherViewBody({
    super.key,
    required this.weatherModel,
  });

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(),
        WeatherData(weather: weatherModel),
        WeatherBottomSheet(weather: weatherModel)
      ],
    );
  }
}
