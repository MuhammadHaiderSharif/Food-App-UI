import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class AcccountContainerItem extends StatelessWidget {
  const AcccountContainerItem(
      {required this.iconStart, required this.title, super.key});

  final IconData iconStart;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconStart,
          color: const Color(
            0xff374151,
          ),
        ),
        const SizedBox(
          width: 24,
        ),
        SizedBox(
          width: 252,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 18,
                  color: const Color(0xff374151),
                ),
              ),
              IconButton(
                constraints: BoxConstraints.loose(
                  const Size(
                    double.infinity,
                    double.infinity,
                  ),
                ),
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Color(0xff9CA3AF),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
