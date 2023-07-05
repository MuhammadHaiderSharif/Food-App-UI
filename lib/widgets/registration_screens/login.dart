import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:food_app/widgets/forget_password_screens/forget_password.dart';
import 'package:food_app/widgets/registration_screens/custom_button_icon.dart';
import 'package:food_app/widgets/registration_screens/custom_textfield.dart';
import 'package:food_app/widgets/registration_screens/custom_button.dart';
import 'package:food_app/models/model_class.dart';
import 'package:food_app/models/custom_snack_bar.dart';
import 'package:food_app/models/db_connection.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void getValues(String title, String value) async {
    if (title == 'Email address') {
      email = value;
    } else if (title == 'Password') {
      password = value;
    }

    if (email != "" && password != "") {
      setState(() {
        enable = true;
      });
    } else {
      setState(() {
        enable = false;
      });
    }
  }

  void requiredFunction() async {
    DbConnection(showSnackBar: showSnackBar).login(email, password, context);
  }

  void showSnackBar() async {
    exist == true
        ? ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar.snackBar3)
        : ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar.snackBar4);
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
    createAccount = false;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 36,
          ),
          CustomTextField(
            titleText: 'Email address',
            hintText: 'Eg namaemail@emailkamu.com',
            getValues: getValues,
            padding: 16.0,
            obscureText: false,
          ),
          CustomTextField(
            titleText: 'Password',
            hintText: '**** **** ****',
            getValues: getValues,
            padding: 0.0,
            keyboardType: TextInputType.visiblePassword,
            obscureText: obscureText,
            suffixIcon: IconButton(
              icon: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
                color: const Color(0xff32B768),
              ),
              onPressed: () {
                checkVisibility();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 160,
              bottom: 18,
              top: 0,
            ),
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xff32B768),
              ),
              child: Text(
                'Forget Password?',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: const Color(0xff32B768),
                ),
              ),
              onPressed: () {
                name = "";
                email = "";
                password = "";
                enable = false;
                Navigator.push(
                  context,
                  PageTransition(
                    child: const ForgetPassword(),
                    type: PageTransitionType.fade,
                    duration: Duration.zero,
                  ),
                );
              },
            ),
          ),
          CustomButton(
            title: 'Login',
            backgroundColor:
                enable ? const Color(0xff32B768) : const Color(0xffF4F4F4),
            foregroundColor:
                enable ? const Color(0xffFFFFFF) : const Color(0xff9CA3AF),
            requiredFunction: requiredFunction,
            enableButton: enable,
          ),
          const Divider(
            thickness: 0.5,
            color: Color(0xffD2D4D8),
            height: 15,
            endIndent: 110,
            indent: 110,
          ),
          const CustomButtonIcon(
            title: 'Login with Google',
            backgroundColor: Color(0xffF4F4F4),
            foregroundColor: Color(0xff222222),
            iconImage: 'assets/images/Google.png',
          ),
          const SizedBox(
            height: 32,
          )
        ],
      ),
    );
  }
}
