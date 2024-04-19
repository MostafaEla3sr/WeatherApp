import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utils/app_colors.dart';
import 'package:weather_app/core/utils/common_use.dart';
import 'package:weather_app/features/home/presentation/view_models/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/features/home/presentation/view_models/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/features/home/presentation/widgets/no_weather_view.dart';
import 'package:weather_app/features/home/presentation/widgets/weather_loading.dart';
import 'package:weather_app/features/home/presentation/widgets/weather_view_body.dart';
import 'package:weather_app/features/search/presentation/views/search_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: BlocConsumer<WeatherCubit, WeatherState>(
        listener: (context, state) {
          if (state is WeatherFailureState) {
            showCustomSnackBar(state, context);
          }
        },
        builder: (context, state) {
          if (state is NoWeatherState) {
            return const NoWeatherView();
          } else if (state is WeatherSuccessState) {
            return WeatherViewBody(
              weatherModel: state.weatherModel,
            );
          } else if (state is WeatherFailureState) {
            return const SearchView();
          } else {
            return const WeatherLoading();
          }
        },
      ),
    );
  }
}
