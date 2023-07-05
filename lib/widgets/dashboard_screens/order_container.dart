import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class OrderContainer extends StatelessWidget {
  const OrderContainer(
      {required this.image,
      required this.title,
      required this.subtitle,
      required this.logo,
      required this.colors,
      super.key});

  final String image;
  final String title;
  final String subtitle;
  final String logo;
  final List<Color> colors;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        margin: const EdgeInsets.only(
          top: 0.0,
          right: 12,
        ),
        padding: const EdgeInsets.only(
          left: 10,
        ),
        height: 135,
        width: 278,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(colors: colors),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    height: 30,
                    width: 48,
                    image: AssetImage(logo),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      bottom: 0.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: const Color(
                              0xffFFFFFF,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          subtitle,
                          style: GoogleFonts.inter(
                            fontSize: 8,
                            fontWeight: FontWeight.w500,
                            color: const Color(
                              0xffFFFFFF,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              'Order',
                              style: GoogleFonts.inter(
                                fontSize: 9,
                                fontWeight: FontWeight.w700,
                                color: const Color(
                                  0xffFFFFFF,
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 11,
                              color: Color(0xffFFFFFF),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Image(
              width: 159,
              image: AssetImage(image),
            ),
          ],
        ),
      ),
    );
  }
}
