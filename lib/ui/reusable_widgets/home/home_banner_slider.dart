import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class HomeBannerSlider extends StatelessWidget {
  const HomeBannerSlider({
    super.key,
    required CarouselController carouselController,
    required ValueNotifier<int> currentSelectedIndex,
  })  : _carouselController = carouselController,
        _currentSelectedIndex = currentSelectedIndex;

  final CarouselController _carouselController;
  final ValueNotifier<int> _currentSelectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
              autoPlay: true,
              reverse: true,
              height: 180.0,
              viewportFraction: 1,
              onPageChanged: (index, _) {
                _currentSelectedIndex.value = index;
              }),
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
        ),

        const SizedBox(
          height: 5,
        ),

        /// er kaj holo jara value golo k listen korte pare,mane er kono ekta value
        /// value change  hole se sathe sathe kaw k react kore bole dei j tar value
        /// ta change hoise
        /// it is use for indicatior creator

        ValueListenableBuilder(
            valueListenable: _currentSelectedIndex,
            builder: (context, updateValue, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 5; i++)
                    Container(
                      margin: EdgeInsets.all(4),
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                          color: i == _currentSelectedIndex.value
                              ? AppColor.primaryColor
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey)),
                    )
                ],
              );
            }),
      ],
    );
  }
}
