import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:weather_app/features/home/presentation/views/home_view.dart';

class BackArrow extends StatelessWidget {
  const BackArrow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      left: 10,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      type: PageTransitionType.leftToRight,
                      alignment: Alignment.center,
                      duration: const Duration(milliseconds: 500),
                      child: const HomeView()));
            },
            icon: const Icon(
              Icons.chevron_left,
              size: 34,
              color: Colors.white,
            ),
          ),
          // Text('Back to home' , style: Styles.textStyle20.copyWith(fontWeight: FontWeight.normal),),
        ],
      ),
    );
  }
}
