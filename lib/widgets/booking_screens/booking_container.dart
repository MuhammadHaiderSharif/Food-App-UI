import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import 'package:food_app/models/custom_snack_bar.dart';
import 'package:food_app/models/model_class.dart';
import 'package:food_app/widgets/booking_screens/restaurant_details.dart';

class BookingContainer extends StatelessWidget {
  const BookingContainer(
      {required this.image,
      required this.title,
      required this.subtitle,
      required this.buttonTitle,
      this.requiredFunction,
      super.key});

  final String image;
  final String title;
  final String subtitle;
  final String buttonTitle;
  final void Function(BuildContext context)? requiredFunction;

  @override
  Widget build(BuildContext context) {
    void navigateToRestaurantDetails(
      BuildContext context,
    ) {
      Navigator.push(
        context,
        PageTransition(
          child: RestaurantDetails(
            image: image,
            title: title,
            subtitle: subtitle,
          ),
          type: PageTransitionType.fade,
          duration: Duration.zero,
        ),
      );
    }

    void bookingFunction(BuildContext context) {
      Model.bookedList.add(
        BookingContainer(
          image: image,
          title: title,
          subtitle: subtitle,
          buttonTitle: 'Check',
          requiredFunction: navigateToRestaurantDetails,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar.snackBar5);
    }

    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8,
        right: 16,
        left: 16,
      ),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(
          10,
        ),
        child: Container(
          height: 88,
          width: double.infinity,
          padding: const EdgeInsets.only(
            top: 12,
            bottom: 12,
            left: 12,
            right: 12,
          ),
          decoration: BoxDecoration(
            // color: const Color(0xffFFFFFF),

            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 64,
                width: 64,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(image),
                    opacity: 0.9,
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              SizedBox(
                width: 224,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 16,
                              color: Color(0xff32B768),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              subtitle,
                              style: GoogleFonts.inter(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff6B7280),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 4,
                            ),
                            Material(
                              color: const Color(0xff32B768),
                              borderRadius: BorderRadius.circular(
                                8,
                              ),
                              elevation: 0.0,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(
                                  8,
                                ),
                                onTap: () {
                                  requiredFunction == null
                                      ? bookingFunction(context)
                                      : requiredFunction!(context);
                                },
                                child: Container(
                                  height: 28,
                                  width: 88,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Text(
                                      buttonTitle,
                                      style: GoogleFonts.inter(
                                        color: const Color(0xffFFFFFF),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
