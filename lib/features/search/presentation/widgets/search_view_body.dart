import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/core/resources/assets_manager.dart';
import 'package:weather_app/core/utils/app_colors.dart';
import 'package:weather_app/core/utils/app_const.dart';
import 'package:weather_app/core/utils/common_use.dart';
import 'package:weather_app/core/utils/styles.dart';
import 'package:weather_app/features/home/presentation/view_models/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/features/home/presentation/views/home_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 100,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black45.withOpacity(0.4),
                  offset: const Offset(0, 5),
                  blurRadius: 10,
                  spreadRadius: 0,
                )
              ],
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [
                  AppColors.textFieldColor1.withOpacity(0.8),
                  AppColors.textFieldColor2.withOpacity(0.8),
                ],
              ),
            ),
            child: Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                // Filter the cities based on the user input
                return countriesList.where((String option) {
                  return option
                      .toLowerCase()
                      .startsWith(textEditingValue.text.toLowerCase());
                }).toList();
              },
              onSelected: (String selectedCity) {
                // Do something with the selected city
                print('Selected city: $selectedCity');
              },
              fieldViewBuilder: (BuildContext context,
                  TextEditingController textEditingController,
                  FocusNode focusNode,
                  VoidCallback onFieldSubmitted) {
                return TextField(
                  controller: textEditingController,
                  focusNode: focusNode,
                  onSubmitted: (value) async {
                    var getWeatherCubit =
                        BlocProvider.of<WeatherCubit>(context);
                    getWeatherCubit.getWeather(cityName: value);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeView(),
                        ));
                  },
                  cursorHeight: 28,
                  style: Styles.textStyle18Bold,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 20,
                      color: Colors.grey,
                    ),
                    hintText: 'Search a city...',
                    hintStyle: Styles.textStyle18,
                    fillColor: Colors.transparent,
                    focusedBorder: buildOutlineInputBorder(),
                    disabledBorder: buildOutlineInputBorder(),
                    enabledBorder: buildOutlineInputBorder(),
                    border: buildOutlineInputBorder(),
                    contentPadding: const EdgeInsets.all(10),
                  ),
                );
              },
              optionsViewBuilder: (BuildContext context,
                  AutocompleteOnSelected<String> onSelected,
                  Iterable<String> options) {
                return Align(
                  alignment: Alignment.topLeft,
                  child: Material(
                    elevation: 4.0,
                    color: AppColors.textFieldColor2,
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width - 24,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: options.length,
                        itemBuilder: (BuildContext context, int index) {
                          final String option = options.elementAt(index);
                          return ListTile(
                            title: Text(
                              option,
                              style: Styles.textStyle16,
                            ),
                            onTap: () => onSelected(option),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(
          height: 100,
        ),
        Lottie.asset(AppAssets.search5,
            width: MediaQuery.sizeOf(context).width - 80),
      ],
    );
  }
}
