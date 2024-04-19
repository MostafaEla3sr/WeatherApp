import 'package:dartz/dartz.dart';
import 'package:weather_app/core/errors/failure.dart';
import 'package:weather_app/features/home/data/models/weather_model.dart';

abstract class WeatherRepo {
  Future<Either<Failure, WeatherModel>> getWeather({required String cityName});
}
