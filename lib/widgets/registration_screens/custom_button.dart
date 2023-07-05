import 'package:flutter/material.dart';

import 'package:food_app/models/model_class.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {required this.enableButton,
      required this.title,
      required this.backgroundColor,
      required this.foregroundColor,
      required this.requiredFunction,
      super.key});

  final String title;
  final Color backgroundColor;
  final Color foregroundColor;
  final void Function() requiredFunction;
  final bool enableButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        fixedSize: const Size(256, 49),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: enableButton
          ? () async {
              if (title == 'Create Account' ||
                  (title == 'Login' &&
                      backgroundColor == const Color(0xffD1FAE5))) {
                name = "";
                email = "";
                password = "";
                enable = false;
              }
              if (title == 'Create Account') {
                createAccount = true;
              } else {
                createAccount = false;
              }
              requiredFunction();
            }
          : null,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
