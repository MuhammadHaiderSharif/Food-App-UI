import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:food_app/widgets/onboarding_screens/carousel_slider_indicator.dart';
import 'package:food_app/widgets/account_screens/account_container_items.dart';
import 'package:food_app/models/model_class.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 6,
            ),
            Material(
              elevation: 1.0,
              borderRadius: BorderRadius.circular(11),
              child: Container(
                height: 75,
                width: 327,
                margin: const EdgeInsets.only(
                  right: 0,
                  left: 0,
                ),
                padding: const EdgeInsets.only(
                  top: 13,
                  bottom: 13,
                  right: 14,
                  left: 14,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/images/Profile.jpg'),
                    ),
                    const SizedBox(
                      width: 1,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: const Color(0xff374151),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          email,
                          style: GoogleFonts.inter(
                            color: const Color(0xff6B7280),
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    Stack(
                      children: const [
                        CircleAvatar(
                          backgroundColor: Color(0xffF9F9F9),
                          child: Icon(
                            Icons.notifications_outlined,
                            color: Color(0xff374151),
                            size: 22,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 7,
                            backgroundColor: Colors.red,
                            child: Center(
                              child: Text(
                                '3',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Material(
              elevation: 1.0,
              borderRadius: BorderRadius.circular(11),
              child: Container(
                height: 75,
                width: 327,
                margin: const EdgeInsets.only(
                  right: 0,
                  left: 0,
                ),
                padding: const EdgeInsets.only(
                  top: 13,
                  bottom: 13,
                  right: 14,
                  left: 14,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.account_circle,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                    Text(
                      'Account settings',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        color: const Color(0xff374151),
                      ),
                    ),
                    const SizedBox(
                      width: 93,
                    ),
                    IconButton(
                      constraints: BoxConstraints.loose(
                          const Size(0.0, double.infinity)),
                      iconSize: 18,
                      icon: const Icon(
                        Icons.edit_sharp,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Material(
              elevation: 1.0,
              borderRadius: BorderRadius.circular(11),
              child: Container(
                  height: 184,
                  width: 327,
                  padding: const EdgeInsets.only(
                    top: 12,
                    bottom: 12,
                    right: 4,
                    left: 16,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Column(
                    children: const [
                      AcccountContainerItem(
                        iconStart: Icons.g_translate,
                        title: 'Langauge',
                      ),
                      AcccountContainerItem(
                        iconStart: Icons.message,
                        title: 'Feedback',
                      ),
                      AcccountContainerItem(
                        iconStart: Icons.star,
                        title: 'Rate us',
                      ),
                      AcccountContainerItem(
                        iconStart: Icons.download,
                        title: 'New Version',
                      ),
                    ],
                  )),
            ),
            const SizedBox(
              height: 35,
            ),
            ElevatedButton(
              onPressed: () {
                name = "";
                email = "";
                password = "";
                enable = false;
                exist = false;
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CarouselSliderIndicator(),
                  ),
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    11,
                  ),
                ),
                fixedSize: const Size(111, 35),
                backgroundColor: const Color(0xffEB4646),
                foregroundColor: const Color(0xffFFFFFF),
              ),
              child: Text(
                'Logout',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
