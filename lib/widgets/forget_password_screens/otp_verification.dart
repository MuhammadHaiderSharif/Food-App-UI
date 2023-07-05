import 'package:flutter/material.dart';
import 'package:food_app/widgets/forget_password_screens/forget_password.dart';
import 'package:page_transition/page_transition.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:food_app/models/custom_snack_bar.dart';
import 'package:food_app/models/model_class.dart';
import 'package:food_app/widgets/forget_password_screens/change_password.dart';
import 'package:food_app/widgets/forget_password_screens/otp_textfield.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({super.key});

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  final CountdownController _controller = CountdownController(
    autoStart: true,
  );

  String hideEmail(int index) {
    String result = email.substring(0, index);
    int p = 0;

    for (int i = index; i < email.length; i++) {
      if (email[i] == "@") {
        p = i;
        break;
      } else {
        result = '$result*';
      }
    }

    for (int i = p; i < email.length; i++) {
      result += email[i];
    }

    return result;
  }

  void getPin(String pinEntered, int index) {
    pin[index] = pinEntered;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        email = "";
        pin = ["0", "0", "0", "0"];
        enable = false;
        emailRegistered = false;
        Navigator.push(
          context,
          PageTransition(
            child: const ForgetPassword(),
            type: PageTransitionType.fade,
            duration: Duration.zero,
          ),
        );
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        appBar: AppBar(
          backgroundColor: const Color(0xff32B768),
          elevation: 0.0,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(
            top: 30,
            left: 22,
            right: 22,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Verification code',
                style: GoogleFonts.inter(
                  color: const Color(0xff374151),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'We have sent the code verification to',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff9CA3AF),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                hideEmail(1),
                style: GoogleFonts.inter(
                  color: const Color(0xff374151),
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Form(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OTPTextfield(
                      getPin: getPin,
                      index: 0,
                    ),
                    OTPTextfield(
                      getPin: getPin,
                      index: 1,
                    ),
                    OTPTextfield(
                      getPin: getPin,
                      index: 2,
                    ),
                    OTPTextfield(
                      getPin: getPin,
                      index: 3,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              resend == false
                  ? Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Resend code after',
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff9CA3AF),
                            ),
                          ),
                          const SizedBox(
                            height: 120,
                          ), // const SizedBox(
                          //   width: 1,
                          // ),
                          Countdown(
                            controller: _controller,
                            seconds: 140,
                            build: (BuildContext context, double time) => Text(
                              style: GoogleFonts.inter(
                                fontSize: 90,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff10B981),
                              ),
                              time.toStringAsFixed(
                                0,
                              ),
                            ),
                            interval: const Duration(
                              milliseconds: 1000,
                            ),
                            onFinished: () {
                              setState(() {
                                resend = true;
                              });
                            },
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(
                      height: 16,
                      width: double.infinity,
                    ),
              SizedBox(
                height: resend == false ? 132 : 365,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(
                          0xffD1FAE5,
                        ),
                        fixedSize: const Size(
                          140,
                          45,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                        ),
                      ),
                      onPressed: resend == true
                          ? () async {
                              pin = ["0", "0", "0", "0"];
                              pinValue = "";
                              Model.sendOTP(context);
                              setState(() {});
                            }
                          : null,
                      child: Text(
                        "Resend",
                        style: TextStyle(
                          color: resend == false
                              ? Colors.white
                              : const Color(0xff10B981),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff32B768),
                      fixedSize: const Size(
                        140,
                        45,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          12,
                        ),
                      ),
                    ),
                    onPressed: () async {
                      for (int i = 0; i < pin.length; i++) {
                        pinValue = pinValue + pin[i];
                      }
                      if (await myauth.verifyOTP(otp: pinValue) == true) {
                        pin = ["0", "0", "0", "0"];
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context)
                            .showSnackBar(CustomSnackBar.snackBar8);
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          PageTransition(
                            child: const ChangePassword(),
                            type: PageTransitionType.fade,
                            duration: Duration.zero,
                          ),
                        );
                      } else {
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          CustomSnackBar.snackBar9,
                        );
                      }

                      enable = false;
                      pinValue = "";
                    },
                    child: const Text(
                      "Confirm",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
