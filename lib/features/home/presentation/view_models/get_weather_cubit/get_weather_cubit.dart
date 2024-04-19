import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/data/models/weather_model.dart';
import 'package:weather_app/features/home/data/repos/weather_repo.dart';
import 'package:weather_app/features/home/presentation/view_models/get_weather_cubit/get_weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherRepo) : super(NoWeatherState());
  final WeatherRepo weatherRepo;

  WeatherModel? weatherModel;

  getWeather({required String cityName}) async {
    emit(WeatherLoadingState());
    var result = await weatherRepo.getWeather(cityName: cityName);
    result.fold((error) {
      print("error while get user data ${error.errorMessage}");
      return emit(WeatherFailureState(errMessage: error.errorMessage));
    }, (success) {
      weatherModel = success;
      return emit(WeatherSuccessState(success));
    });
  }
}
