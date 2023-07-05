import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingScreens extends StatelessWidget {
  const OnBoardingScreens(
      {required this.title,
      required this.subTitle,
      required this.image,
      required this.distanceBetween,
      required this.fontSize,
      required this.distanceTop,
      super.key});

  final String title;
  final String subTitle;
  final String image;
  final double distanceBetween;
  final double fontSize;
  final double distanceTop;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: distanceTop,
            ),
            Image.asset(
              image,
              scale: 1,
            ),
            SizedBox(
              height: distanceBetween,
            ),
            Text(
              title,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: const Color(0xff1F2937),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            FittedBox(
              child: Text(
                subTitle,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: fontSize,
                  color: const Color(0xff4B5563),
                ),
              ),
            ),
            // const SizedBox(
            //   height: 60,
            // )
          ],
        ),
      ),
    );
  }
}
