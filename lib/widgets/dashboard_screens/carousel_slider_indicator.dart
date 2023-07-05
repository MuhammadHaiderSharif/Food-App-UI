import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider(
          items: Model.orderContainerList,
          carouselController: _controller,
          options: CarouselOptions(
            autoPlay: true,
            viewportFraction: 0.8,
            enableInfiniteScroll: true,
            disableCenter: true,
            height: 145,
            enlargeStrategy: CenterPageEnlargeStrategy.zoom,
            onPageChanged: (index, reason) {
              setState(
                () {
                  _current = index;
                },
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: Model.onBoardingScreensList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 10.0,
                height: 10.0,
                margin: const EdgeInsets.only(
                  top: 18,
                  right: 3.0,
                  left: 3.0,
                ),
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
      ],
    );
  }
}
