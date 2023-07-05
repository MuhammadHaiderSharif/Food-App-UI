import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:food_app/widgets/registration_screens/custom_button.dart';
import 'package:food_app/widgets/registration_screens/customtext.dart';
import 'package:food_app/widgets/registration_screens/registration.dart';
import 'package:food_app/widgets/onboarding_screens/carousel_slider_indicator.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    void showSheet() {
      showModalBottomSheet<void>(
        elevation: 32,
        isScrollControlled: true,
        enableDrag: true,
        isDismissible: false,
        backgroundColor: Colors.white,
        barrierColor: Colors.grey.shade200.withOpacity(0.4),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(36),
          ),
        ),
        context: context,
        builder: (context) => Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom * 0.34,
          ),
          child: const Registration(),
        ),
      );
    }

    return WillPopScope(
      onWillPop: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const CarouselSliderIndicator(),
          ),
          (route) => false,
        );
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Image.asset('assets/images/Order Success.png'),
                const SizedBox(
                  height: 55.01,
                ),
                Text(
                  'Welcome',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: const Color(0xff1F2937),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                FittedBox(
                  child: Text(
                    'Before enjoying Foodmedia services\nPlease register first',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: const Color(0xff4B5563),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 95,
                ),
                CustomButton(
                  title: 'Create Account',
                  backgroundColor: const Color(0xff32B768),
                  foregroundColor: Colors.white,
                  requiredFunction: showSheet,
                  enableButton: true,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomButton(
                  title: 'Login',
                  backgroundColor: const Color(0xffD1FAE5),
                  foregroundColor: const Color(0xff10B981),
                  requiredFunction: showSheet,
                  enableButton: true,
                ),
                const SizedBox(
                  height: 16,
                ),
                const CustomText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
