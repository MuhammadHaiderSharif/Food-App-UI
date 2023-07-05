
import 'package:flutter/material.dart';
import 'package:food_app/widgets/dashboard_screens/explore_restaurants.dart';
import 'package:food_app/models/model_class.dart';

import 'package:page_transition/page_transition.dart';
import 'package:google_fonts/google_fonts.dart';

class NewBooking extends StatelessWidget {
  const NewBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 18,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Explore Restaurant',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Check your city Near by Restaurant',
                    style: GoogleFonts.inter(
                      color: const Color(0xff6B7280),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 68,
            ),
            ElevatedButton(
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
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                padding: EdgeInsets.zero,
                minimumSize: const Size(0.0, 0.0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ).copyWith(
                overlayColor:
                    const MaterialStatePropertyAll(Colors.transparent),
                elevation: const MaterialStatePropertyAll(0.0),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'See All',
                    style: GoogleFonts.inter(
                      color: const Color(0xff6B7280),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 13,
                    color: Color(0xff89909E),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 408,
          width: double.infinity,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(
              bottom: 8,
              top: 16,
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              return Model.bookingContainerList[index];
            },
          ),
        ),
      ],
    );
  }
}
