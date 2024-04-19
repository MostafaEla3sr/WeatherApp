import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/app_colors.dart';
import 'package:weather_app/core/widgets/back_arrow.dart';
import 'package:weather_app/core/widgets/background_image.dart';
import 'package:weather_app/features/search/presentation/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            BackgroundImage(),
            SearchViewBody(),
            BackArrow(),
          ],
        ),
      ),
    );
  }
}
