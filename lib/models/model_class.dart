import 'package:flutter/material.dart';
import 'package:email_otp/email_otp.dart';

import 'package:food_app/widgets/booking_screens/booking_container.dart';
import 'package:food_app/widgets/dashboard_screens/arrival_container.dart';
import 'package:food_app/widgets/onboarding_screens/onboarding_screen.dart';
import 'package:food_app/widgets/dashboard_screens/order_container.dart';
import 'package:food_app/models/custom_snack_bar.dart';

bool createAccount = false;
bool exist = false;
String name = "";
String email = "";
String password = "";
bool enable = false;
bool obscureText = true;
bool resend = false;
bool emailRegistered = false;
String confirmPassword = "";
String pinValue = "";
List<String> pin = ["0", "0", "0", "0"];

EmailOTP myauth = EmailOTP();

class Model {
  static void sendOTP(BuildContext context) async {
    resend = false;
    myauth.setConfig(
        appEmail: "muhammad.53866@iqra.edu.pk",
        appName: "Food Panda",
        userEmail: email,
        otpLength: 4,
        otpType: OTPType.digitsOnly);
    if (await myauth.sendOTP() == true) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        CustomSnackBar.snackBar6,
      );
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        CustomSnackBar.snackBar7,
      );
    }
  }

  static final List<Widget> onBoardingScreensList = [
    const OnBoardingScreens(
      title: 'Nearby Restaurants',
      subTitle:
          'You don\'t have to go far to find a good restaurant,\nwe have provided all the restaurants that\n is near you',
      image: 'assets/images/Tracking & Maps.png',
      distanceBetween: 84.48,
      fontSize: 12,
      distanceTop: 200,
    ),
    const OnBoardingScreens(
      title: 'Select the Favorites Menu',
      subTitle:
          'Now eat well, don\'t leave the house,You can\nchoose your favorite food only with\none click',
      image: 'assets/images/Order illustration.png',
      distanceBetween: 16.16,
      fontSize: 12,
      distanceTop: 155.53,
    ),
    const OnBoardingScreens(
      title: 'Good food at a cheap price',
      subTitle: 'You can eat at expensive restaurants with\naffordable price',
      image: 'assets/images/Safe Food.png',
      distanceBetween: 66.48,
      fontSize: 14,
      distanceTop: 130,
    ),
  ];

  static final List<Widget> orderContainerList = [
    OrderContainer(
      logo: 'assets/images/BurgerKing.png',
      image: 'assets/images/Burger.png',
      colors: [
        const Color(0xffFF9F06).withOpacity(0.8),
        const Color(0xffFFE1B4).withOpacity(0.9),
      ],
      title: 'Flash Offer',
      subtitle: 'We are here with the best\ndeserts intown.',
    ),
    OrderContainer(
      logo: 'assets/images/BurgerKing.png',
      image: 'assets/images/Burger.png',
      colors: [
        const Color(0xff32B768).withOpacity(0.8),
        const Color.fromARGB(255, 186, 255, 213).withOpacity(0.9),
      ],
      title: 'New',
      subtitle: 'We are here with the best\ndeserts intown.',
    ),
    OrderContainer(
      logo: 'assets/images/BurgerKing.png',
      image: 'assets/images/Burger.png',
      colors: [
        Colors.blue.withOpacity(0.8),
        const Color.fromARGB(255, 179, 221, 255).withOpacity(0.9),
      ],
      title: 'Big Deal',
      subtitle: 'We are here with the best\ndeserts intown.',
    ),
  ];

  static final List<Widget> arrivalContainerList = [
    const ArrivalContainer(
      image: 'assets/images/Biryani.png',
      title: 'Chicken Biryani',
      subtitle: 'Ambrosia Hotel &\nRestaurant',
    ),
    const ArrivalContainer(
      image: 'assets/images/Tonkatsu.png',
      title: 'Sauce Tonkatsu',
      subtitle: 'Handi Restaurant,\nChittagong',
    ),
    const ArrivalContainer(
      image: 'assets/images/Biryani.png',
      title: 'Chicken Biryani',
      subtitle: 'Ambrosia Hotel &\nRestaurant',
    ),
  ];

  static List<Widget> bookingContainerList = [
    const BookingContainer(
      image: 'assets/images/Ambrosia.png',
      title: 'Hotel Zaman Restaurant',
      subtitle: 'kazi Deiry, Taiger Pass\nChittagong',
      buttonTitle: 'Book',
    ),
    const BookingContainer(
      image: 'assets/images/Tava.png',
      title: 'Ambrosia Hotel & Restaurant',
      subtitle: 'kazi Deiry, Taiger Pass\nChittagong',
      buttonTitle: 'Book',
    ),
    const BookingContainer(
      image: 'assets/images/Ambrosia.png',
      title: 'Tava Restaurant',
      subtitle: 'Zakir Hossain Rd,\nChittagong',
      buttonTitle: 'Book',
    ),
    const BookingContainer(
      image: 'assets/images/Tava.png',
      title: 'Haatkhola',
      subtitle: '6 Surson Road,\nChittagong',
      buttonTitle: 'Book',
    ),
    const BookingContainer(
      image: 'assets/images/Ambrosia.png',
      title: 'Haatkhola',
      subtitle: '6 Surson Road,\nChittagong',
      buttonTitle: 'Book',
    ),
  ];

  static final List<Widget> bookedList = [];
}
