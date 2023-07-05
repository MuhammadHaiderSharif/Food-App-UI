import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import 'package:food_app/widgets/dashboard_screens/explore_restaurants.dart';
import 'package:food_app/models/model_class.dart';

class BookingHistory extends StatelessWidget {
  const BookingHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Model.bookedList.isEmpty
          ? Center(
              child: Text(
              'No bookings found',
              style:
                  GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),
            ))
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                height: 614,
                width: double.infinity,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(
                    bottom: 8,
                    top: 16,
                  ),
                  itemCount: Model.bookedList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Model.bookedList[index],
                        Model.bookedList.length - 1 == index
                            ? ElevatedButton.icon(
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
                                label: Text(
                                  'Booking more',
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                icon: const Icon(
                                  Icons.add,
                                  color: Color(0xff6B7280),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: const Color(0xff6B7280),
                                ),
                              )
                            : const SizedBox(
                                height: 0,
                                width: 0,
                              ),
                      ],
                    );
                  },
                ),
              ),
            ),
    );
  }
}
