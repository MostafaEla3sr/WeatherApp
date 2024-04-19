import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/core/errors/failure.dart';
import 'package:weather_app/core/errors/handling_error.dart';
import 'package:weather_app/core/services/api_service.dart';
import 'package:weather_app/features/home/data/models/weather_model.dart';
import 'package:weather_app/features/home/data/repos/weather_repo.dart';

class WeatherRepoImplementation extends WeatherRepo {
  @override
  Future<Either<Failure, WeatherModel>> getWeather(
      {required String cityName}) async {
    try {
      Response response = await GetData.getData(
        path: '/forecast.json?key=$apiKey&q=$cityName&days=5',
      );
      print(response.data);
      if (response.statusCode == 200) {
        return right(WeatherModel.fromJson(response.data));
      } else {
        return left(
            RequestFailure(errorMessage: response.data["error"]["message"]));
      }
    } catch (e) {
      if (e is DioException) {
        return left(RequestFailure.fromDioException(e));
      } else {
        return left(RequestFailure(errorMessage: e.toString()));
      }
    }
  }
}
