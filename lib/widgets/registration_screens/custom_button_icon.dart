import 'package:flutter/material.dart';

class CustomButtonIcon extends StatelessWidget {
  const CustomButtonIcon(
      {this.createAccount,
      required this.title,
      required this.backgroundColor,
      required this.foregroundColor,
      required this.iconImage,
      super.key});

  final String title;
  final Color backgroundColor;
  final Color foregroundColor;
  final bool? createAccount;
  final String iconImage;

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
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            iconImage,
            height: 20,
            width: 20,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
