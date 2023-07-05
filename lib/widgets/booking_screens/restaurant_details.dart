import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'package:food_app/widgets/booking_screens/restaurant_details_body.dart';
import 'package:food_app/widgets/dashboard_screens/appbars.dart';
import 'package:food_app/widgets/dashboard_screens/explore_restaurants.dart';

class RestaurantDetails extends StatefulWidget {
  const RestaurantDetails(
      {required this.title,
      required this.subtitle,
      required this.image,
      super.key});

  final String title;
  final String subtitle;
  final String image;

  @override
  State<RestaurantDetails> createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails> {
  @override
  Widget build(BuildContext context) {
    String subtitle = widget.subtitle.replaceAll('\n', ' ');
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: Appbars.bookingDetailsAppBar(),
      backgroundColor: const Color(0xffF6F6F6),
      body: RestaurantDetailsBody(
        image: widget.image,
        title: widget.title,
        subtitle: subtitle,
      ),
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Material buildMyNavBar(BuildContext context) {
    return Material(
      elevation: 40.0,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      child: Container(
        height: 85,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                backgroundColor: const Color(0xff32B768),
                foregroundColor: const Color(0xffFFFFFF),
                fixedSize: const Size(232, 33),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: const ExploreRestaurants(),
                    type: PageTransitionType.fade,
                    duration: Duration.zero,
                  ),
                );
              },
              child: const Text(
                'Booking',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
