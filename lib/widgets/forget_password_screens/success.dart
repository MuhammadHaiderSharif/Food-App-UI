import 'package:flutter/material.dart';
import 'package:food_app/widgets/registration_screens/welcome.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:food_app/models/model_class.dart';
import 'package:food_app/widgets/registration_screens/custom_button.dart';
import 'package:page_transition/page_transition.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> requiredFunction() async {
      email = "";
      pin = ["0", "0", "0", "0"];
      enable = false;
      emailRegistered = false;

      Navigator.push(
        context,
        PageTransition(
          child: const Welcome(),
          type: PageTransitionType.fade,
          duration: Duration.zero,
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 250,
            ),
            Material(
              shadowColor: const Color(0xffD1FAE5),
              elevation: 10,
              borderRadius: BorderRadius.circular(30),
              child: const CircleAvatar(
                backgroundColor: Color(0xff32B768),
                radius: 30,
                child: Icon(
                  Icons.check_sharp,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            const SizedBox(
              height: 29,
            ),
            Text(
              'Success',
              style: GoogleFonts.inter(
                color: const Color(0xff374151),
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Congratulations your password has\nbeen changed',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xff828282),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 220,
            ),
            CustomButton(
              title: 'Sign in',
              backgroundColor:
                  enable ? const Color(0xff32B768) : const Color(0xffF4F4F4),
              foregroundColor:
                  enable ? const Color(0xffFFFFFF) : const Color(0xff9CA3AF),
              requiredFunction: requiredFunction,
              enableButton: enable,
            ),
          ],
        ),
      ),
    );
  }
}
