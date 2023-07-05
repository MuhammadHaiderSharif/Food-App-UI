import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import 'package:food_app/widgets/registration_screens/welcome.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:food_app/models/model_class.dart';

class CarouselSliderIndicator extends StatefulWidget {
  const CarouselSliderIndicator({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CarouselSliderIndicatorState();
  }
}

class _CarouselSliderIndicatorState extends State<CarouselSliderIndicator> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  Future<bool> showExitPopup() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Exit App'),
            content: const Text('Do you want to exit an App?'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff32B768),
                ),
                child: const Text('No'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff32B768),
                ),
                child: const Text('Yes'),
              ),
            ],
          ),
        ) ??
        false; //if showDialouge had returned null, then return false
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: CarouselSlider(
                items: Model.onBoardingScreensList,
                carouselController: _controller,
                options: CarouselOptions(
                    viewportFraction: 1,
                    enlargeFactor: 0.6,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    disableCenter: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 8.0,
                left: 8.0,
                bottom: 20,
                top: 0.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.transparent,
                    ).copyWith(
                      overlayColor:
                          const MaterialStatePropertyAll(Colors.transparent),
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
                    child: Text(
                      'Skip',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: const Color(0xff4B5563),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: Model.onBoardingScreensList
                        .asMap()
                        .entries
                        .map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 12.0,
                          height: 12.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (_current == entry.key
                                ? const Color(0xff32B768)
                                : const Color(0xffE6E6E6)),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    width: 58,
                    child: IconButton(
                      splashRadius: null,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: _current < 2
                          ? () => _controller.animateToPage(_current + 1)
                          : () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  child: const Welcome(),
                                  type: PageTransitionType.fade,
                                  duration: Duration.zero,
                                ),
                              );
                            },
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Color(0xff32B768),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
