import 'package:flutter/material.dart';

class CustomSnackBar {
  static final snackBar1 = SnackBar(
    duration: const Duration(
      milliseconds: 250,
    ),
    dismissDirection: DismissDirection.down,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.only(
      bottom: 620,
      right: 14,
      left: 14,
    ),
    content: const Text(
      'Email address or password already exists!',
      style: TextStyle(
        color: Color(0xff10B981),
      ),
    ),
    backgroundColor: Colors.black,
    action: SnackBarAction(
      label: 'Dismiss',
      textColor: Colors.white,
      onPressed: () {},
    ),
  );

  static final snackBar2 = SnackBar(
    duration: const Duration(
      milliseconds: 620,
    ),
    dismissDirection: DismissDirection.down,
    margin: const EdgeInsets.only(
      bottom: 620,
      right: 14,
      left: 14,
    ),
    behavior: SnackBarBehavior.floating,
    content: const Text(
      'Registered Successfully!',
      style: TextStyle(
        color: Color(0xff10B981),
      ),
    ),
    backgroundColor: Colors.black,
    action: SnackBarAction(
      label: 'Dismiss',
      textColor: Colors.white,
      onPressed: () {},
    ),
  );

  static final snackBar3 = SnackBar(
    duration: const Duration(
      milliseconds: 1500,
    ),
    dismissDirection: DismissDirection.down,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.only(
      bottom: 20,
      right: 14,
      left: 14,
    ),
    content: const Text(
      'Login Successfully!',
      style: TextStyle(
        color: Color(0xff10B981),
      ),
    ),
    backgroundColor: Colors.black,
    action: SnackBarAction(
      label: 'Dismiss',
      textColor: Colors.white,
      onPressed: () {},
    ),
  );
  static final snackBar4 = SnackBar(
    duration: const Duration(
      milliseconds: 250,
    ),
    dismissDirection: DismissDirection.down,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.only(
      bottom: 620,
      right: 14,
      left: 14,
    ),
    content: const Text(
      'Email address or password is incorrect!',
      style: TextStyle(
        color: Color(0xff10B981),
      ),
    ),
    backgroundColor: Colors.black,
    action: SnackBarAction(
      label: 'Dismiss',
      textColor: Colors.white,
      onPressed: () {},
    ),
  );

  static final snackBar5 = SnackBar(
    duration: const Duration(
      milliseconds: 500,
    ),
    dismissDirection: DismissDirection.down,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.only(
      bottom: 20,
      right: 14,
      left: 14,
    ),
    content: const Text(
      'Booked Successfully!',
      style: TextStyle(
        color: Color(0xff10B981),
      ),
    ),
    backgroundColor: Colors.black,
    action: SnackBarAction(
      label: 'Dismiss',
      textColor: Colors.white,
      onPressed: () {},
    ),
  );
  static final snackBar6 = SnackBar(
    duration: const Duration(
      milliseconds: 500,
    ),
    dismissDirection: DismissDirection.down,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.only(
      bottom: 10,
      right: 14,
      left: 14,
    ),
    content: const Text(
      'OTP has been sent',
      style: TextStyle(
        color: Color(0xff10B981),
      ),
    ),
    backgroundColor: Colors.black,
    action: SnackBarAction(
      label: 'Dismiss',
      textColor: Colors.white,
      onPressed: () {},
    ),
  );

  static final snackBar7 = SnackBar(
    duration: const Duration(
      milliseconds: 500,
    ),
    dismissDirection: DismissDirection.down,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.only(
      bottom: 10,
      right: 14,
      left: 14,
    ),
    content: const Text(
      'Oops, OTP send failed',
      style: TextStyle(
        color: Color(0xff10B981),
      ),
    ),
    backgroundColor: Colors.black,
    action: SnackBarAction(
      label: 'Dismiss',
      textColor: Colors.white,
      onPressed: () {},
    ),
  );

  static final snackBar8 = SnackBar(
    duration: const Duration(
      milliseconds: 500,
    ),
    dismissDirection: DismissDirection.down,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.only(
      bottom: 10,
      right: 14,
      left: 14,
    ),
    content: const Text(
      'OTP is verified',
      style: TextStyle(
        color: Color(0xff10B981),
      ),
    ),
    backgroundColor: Colors.black,
    action: SnackBarAction(
      label: 'Dismiss',
      textColor: Colors.white,
      onPressed: () {},
    ),
  );

  static final snackBar9 = SnackBar(
    duration: const Duration(
      milliseconds: 500,
    ),
    dismissDirection: DismissDirection.down,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.only(
      bottom: 10,
      right: 14,
      left: 14,
    ),
    content: const Text(
      'Invalid OTP',
      style: TextStyle(
        color: Color(0xff10B981),
      ),
    ),
    backgroundColor: Colors.black,
    action: SnackBarAction(
      label: 'Dismiss',
      textColor: Colors.white,
      onPressed: () {},
    ),
  );

  static final snackBar10 = SnackBar(
    duration: const Duration(
      milliseconds: 500,
    ),
    dismissDirection: DismissDirection.down,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.only(
      bottom: 10,
      right: 14,
      left: 14,
    ),
    content: const Text(
      'Could\'nt find your email',
      style: TextStyle(
        color: Color(0xff10B981),
      ),
    ),
    backgroundColor: Colors.black,
    action: SnackBarAction(
      label: 'Dismiss',
      textColor: Colors.white,
      onPressed: () {},
    ),
  );

  static final snackBar11 = SnackBar(
    duration: const Duration(
      milliseconds: 500,
    ),
    dismissDirection: DismissDirection.down,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.only(
      bottom: 10,
      right: 14,
      left: 14,
    ),
    content: const Text(
      'Passwords must be identical.',
      style: TextStyle(
        color: Color(0xff10B981),
      ),
    ),
    backgroundColor: Colors.black,
    action: SnackBarAction(
      label: 'Dismiss',
      textColor: Colors.white,
      onPressed: () {},
    ),
  );
}
