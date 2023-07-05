import 'package:flutter/material.dart';

import 'package:food_app/widgets/onboarding_screens/carousel_slider_indicator.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: const Color(0xff32B768),
      )),
      debugShowCheckedModeBanner: false,
      home: const CarouselSliderIndicator(),
    );
  }
}
