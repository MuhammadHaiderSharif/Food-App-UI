import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:food_app/models/model_class.dart';
import 'package:food_app/widgets/registration_screens/create_account.dart';
import 'package:food_app/widgets/registration_screens/login.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 24),
            width: 48,
            height: 6,
            decoration: BoxDecoration(
              color: const Color(0xffD2D4D8),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      createAccount = true;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Create Account",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: createAccount
                              ? const Color(0xff32B768)
                              : const Color(0xff89909E),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      createAccount
                          ? Container(
                              margin: const EdgeInsets.only(top: 3),
                              height: 2,
                              width: 77,
                              color: const Color(0xff32B768),
                            )
                          : Container(
                              margin: const EdgeInsets.only(top: 3),
                              height: 2,
                              width: 77,
                              color: Colors.transparent,
                            ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      createAccount = false;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        "Login",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: createAccount
                              ? const Color(0xff89909E)
                              : const Color(0xff32B768),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      createAccount
                          ? Container(
                              margin: const EdgeInsets.only(top: 3),
                              height: 2,
                              width: 28,
                              color: Colors.transparent,
                            )
                          : Container(
                              margin: const EdgeInsets.only(top: 3),
                              height: 2,
                              width: 28,
                              color: const Color(0xff32B768),
                            ),
                    ],
                  ),
                ),
              )
            ],
          ),
          createAccount ? const CreateAccount() : const Login(),
        ],
      ),
    );
  }
}
