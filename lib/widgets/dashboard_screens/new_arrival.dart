import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:food_app/models/model_class.dart';

class NewArrival extends StatelessWidget {
  const NewArrival({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 18,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Today New Arrival',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Best of the today  food list update',
                    style: GoogleFonts.inter(
                      color: const Color(0xff6B7280),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 78,
            ),
            Text(
              'See All',
              style: GoogleFonts.inter(
                color: const Color(0xff6B7280),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              width: 2,
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 13,
              color: Color(0xff89909E),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 200,
          width: double.infinity,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(
              bottom: 0.0,
              top: 0.0,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: Model.arrivalContainerList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: index == 2 ? 14 : 0.0),
                child: Model.arrivalContainerList[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
