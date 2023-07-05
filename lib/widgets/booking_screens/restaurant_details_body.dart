import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import 'package:food_app/models/model_class.dart';
import 'package:food_app/widgets/dashboard_screens/explore_restaurants.dart';

class RestaurantDetailsBody extends StatelessWidget {
  const RestaurantDetailsBody(
      {required this.title,
      required this.subtitle,
      required this.image,
      super.key});

  final String title;
  final String subtitle;
  final String image;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(children: [
        Container(
          height: 350,
          width: double.infinity,
          margin: const EdgeInsets.only(
            top: 100,
            bottom: 15,
          ),
          padding: const EdgeInsets.only(
            top: 20,
            left: 18,
            right: 18,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: const Color(0xffFFFFFF),
          ),
          child: Column(
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
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              Container(
                height: 182,
                width: 339,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Check Restaurant.png'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 18,
                  left: 13,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.schedule,
                              color: Color(0xff32B768),
                              size: 16,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Open today',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '10:00 AM - 12:00 PM',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.subdirectory_arrow_right_rounded,
                        size: 20,
                      ),
                      label: Text(
                        'Visit the Restaurant',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          height: 380,
          width: double.infinity,
          margin: const EdgeInsets.only(
            bottom: 15,
          ),
          padding: const EdgeInsets.only(
            top: 20,
            // left: 24,
            // right: 15,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: const Color(0xffFFFFFF),
          ),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'List other restaurant',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Check the menu at this restaurant',
                        style: GoogleFonts.inter(
                          color: const Color(0xff6B7280),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
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
                            color: const Color(0xff32B768),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
                          color: Color(0xff32B768),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 300,
                width: double.infinity,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(
                    bottom: 8,
                    top: 16,
                  ),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Model.bookingContainerList[index];
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 80,
        )
      ]),
    );
  }
}
