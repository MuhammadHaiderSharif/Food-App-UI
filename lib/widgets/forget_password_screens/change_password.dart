import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:food_app/models/model_class.dart';
import 'package:food_app/widgets/registration_screens/custom_button.dart';
import 'package:page_transition/page_transition.dart';
import 'package:food_app/models/custom_snack_bar.dart';
import 'package:food_app/models/db_connection.dart';
import 'package:food_app/widgets/forget_password_screens/password_reset_input.dart';
import 'package:food_app/widgets/forget_password_screens/success.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  void getValues(String title, String value) {
    if (title == 'New Password') {
      password = value;
    } else if (title == 'Confirm Password') {
      confirmPassword = value;
    }

    if (password != "" && confirmPassword != "") {
      setState(() {
        enable = true;
      });
    } else {
      setState(() {
        enable = false;
      });
    }
  }

  Future<void> requiredFunction() async {
    if (password == confirmPassword) {
      DbConnection.alterPassword();
      Navigator.push(
        context,
        PageTransition(
          child: const Success(),
          type: PageTransitionType.fade,
          duration: Duration.zero,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        CustomSnackBar.snackBar11,
      );
    }
  }

  void checkVisibility() {
    setState(() {
      if (obscureText == true) {
        obscureText = false;
      } else {
        obscureText = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xff32B768),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 30,
          left: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Change New Password',
              style: GoogleFonts.inter(
                color: const Color(0xff374151),
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Enter a different password with the previous',
              style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff9CA3AF)),
            ),
            const SizedBox(
              height: 56,
            ),
            PasswordResetInput(
              suffixIcon: IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: const Color(0xff32B768),
                ),
                onPressed: () {
                  checkVisibility();
                },
              ),
              padding: 16,
              titleText: 'New Password',
              hintText: '**** **** ****',
              getValues: getValues,
              obscureText: obscureText,
              keyboardType: TextInputType.visiblePassword,
            ),
            PasswordResetInput(
              suffixIcon: IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: const Color(0xff32B768),
                ),
                onPressed: () {
                  checkVisibility();
                },
              ),
              padding: 16,
              titleText: 'Confirm Password',
              hintText: '**** **** ****',
              getValues: getValues,
              obscureText: obscureText,
              keyboardType: TextInputType.visiblePassword,
            ),
            const SizedBox(
              height: 280,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 33,
              ),
              child: CustomButton(
                title: 'Reset Password',
                backgroundColor:
                    enable ? const Color(0xff32B768) : const Color(0xffF4F4F4),
                foregroundColor:
                    enable ? const Color(0xffFFFFFF) : const Color(0xff9CA3AF),
                requiredFunction: requiredFunction,
                enableButton: enable,
              ),
            ),
            const SizedBox(
              height: 25,
            )
          ],
        ),
      ),
    );
  }
}
