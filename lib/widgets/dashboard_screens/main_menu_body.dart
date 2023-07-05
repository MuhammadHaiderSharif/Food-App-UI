import 'package:flutter/material.dart';

import 'package:food_app/widgets/dashboard_screens/new_arrival.dart';
import 'package:food_app/widgets/dashboard_screens/new_booking.dart';
import 'package:food_app/widgets/dashboard_screens/carousel_slider_indicator.dart';

class MainMenuBody extends StatelessWidget {
  const MainMenuBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SizedBox(
        height: 936,
        child: Column(
          children: const [
            CarouselSliderIndicator(),
            SizedBox(
              height: 35,
            ),
            NewArrival(),
            SizedBox(
              height: 28,
            ),
            NewBooking(),
          ],
        ),
      ),
    );
  }
}
