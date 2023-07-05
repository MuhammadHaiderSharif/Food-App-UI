import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        text: 'By Logging In Or Registering, You Have Agreed To ',
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: Color(0xff242323),
        ),
        children: [
          TextSpan(
            text: 'The Terms And\n',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Color(0xff32B768),
            ),
          ),
          TextSpan(
            text: 'Conditions ',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Color(0xff32B768),
            ),
          ),
          TextSpan(
            text: 'And',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Color(0xff242323),
            ),
          ),
          TextSpan(
            text: 'Privacy Policy.',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Color(0xff32B768),
            ),
          ),
        ],
      ),
    );
  }
}
