import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PracticeImageSlider extends StatelessWidget {
  const PracticeImageSlider(
      {Key? key,
      required this.currentSelectedIndex,
      required this.carouselController})
      : super(key: key);

  final ValueNotifier<int> currentSelectedIndex;
  final CarouselController carouselController;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: carouselController,
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(8)),
                alignment: Alignment.center,
                child: Text(
                  'text $i',
                  style: TextStyle(fontSize: 16.0),
                ));
          },
        );
      }).toList(),
      options: CarouselOptions(
          height: 180.0,
          viewportFraction: 1,
          onPageChanged: (index, _) {
            currentSelectedIndex.value = index;
          }),
    );
  }
}
