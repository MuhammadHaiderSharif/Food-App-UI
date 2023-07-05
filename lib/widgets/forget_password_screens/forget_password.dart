import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import 'package:food_app/models/db_connection.dart';
import 'package:food_app/widgets/registration_screens/welcome.dart';
import 'package:food_app/models/model_class.dart';
import 'package:food_app/widgets/forget_password_screens/password_reset_input.dart';
import 'package:food_app/widgets/registration_screens/custom_button.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  void getValues(String title, String value) {
    if (title == 'Email address') {
      email = value;
    }

    if (email != "") {
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
    DbConnection.checkEmail(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        email = "";
        pin = ["0", "0", "0", "0"];
        enable = false;
        emailRegistered = false;

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const Welcome(),
          ),
          (route) => false,
        );
        return Future.value(false);
      },
      child: Scaffold(
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
                'Forget Password',
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
                'Enter your registered email below',
                style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff9CA3AF)),
              ),
              const SizedBox(
                height: 56,
              ),
              PasswordResetInput(
                padding: 16,
                titleText: 'Email address',
                hintText: 'Eg namaemail@emailkamu.com',
                getValues: getValues,
                obscureText: false,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                ),
                child: Row(
                  children: [
                    Text(
                      'Remember the password? ',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff9CA3AF),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(0.0),
                        minimumSize: const Size(0.0, 0.0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ).copyWith(
                        overlayColor:
                            const MaterialStatePropertyAll(Colors.transparent),
                        elevation: const MaterialStatePropertyAll(0.0),
                      ),
                      child: Text(
                        'Sign in',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff32B768),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: const Welcome(),
                            type: PageTransitionType.fade,
                            duration: Duration.zero,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 330,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 33,
                ),
                child: CustomButton(
                  title: 'Submit',
                  backgroundColor: enable
                      ? const Color(0xff32B768)
                      : const Color(0xffF4F4F4),
                  foregroundColor: enable
                      ? const Color(0xffFFFFFF)
                      : const Color(0xff9CA3AF),
                  requiredFunction: requiredFunction,
                  enableButton: enable,
                ),
              ),
              const SizedBox(
                height: 48,
              )
            ],
          ),
        ),
      ),
    );
  }
}
