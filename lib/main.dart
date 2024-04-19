import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/resources/assets_manager.dart';
import 'package:weather_app/core/services/api_service.dart';
import 'package:weather_app/features/home/data/repos/weather_repo_imp.dart';
import 'package:weather_app/features/home/presentation/view_models/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/features/splash/presentation/views/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ApiService.initDio();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(WeatherRepoImplementation()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather',
        // theme: AppTheme.lightTheme,
        // darkTheme: AppTheme.darkTheme,
        home: SplashView(),
      ),
    );
  }
}

