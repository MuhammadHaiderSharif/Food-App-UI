import 'package:flutter/material.dart';

import 'package:food_app/models/model_class.dart';

class ExploreRestaurants extends StatelessWidget {
  const ExploreRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Explore Restaurants'),
        backgroundColor: const Color(0xff32B768),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: 670,
          width: double.infinity,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(
              bottom: 8,
              top: 16,
            ),
            itemCount: Model.bookingContainerList.length,
            itemBuilder: (context, index) {
              return Model.bookingContainerList[index];
            },
          ),
        ),
      ),
    );
  }
}
