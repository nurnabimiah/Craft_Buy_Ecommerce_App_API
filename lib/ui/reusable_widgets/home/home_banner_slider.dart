/*
import 'package:carousel_slider/carousel_slider.dart';
import 'package:craft_buy/data/models/product_slider_model.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class HomeBannerSlider extends StatelessWidget {
  const HomeBannerSlider({
    super.key,
    required CarouselController carouselController,
    required ValueNotifier<int> currentSelectedIndex,
    required this.productSliderModel,
  })  : _carouselController = carouselController,
        _currentSelectedIndex = currentSelectedIndex;

  final CarouselController _carouselController;
  final ValueNotifier<int> _currentSelectedIndex;

  final ProductSliderModel productSliderModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
              height: 180.0,
              autoPlay: true,
              viewportFraction: 1,
              onPageChanged: (index, _) {
                _currentSelectedIndex.value = index;
              }),
          items: productSliderModel.data?.map((slider) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 1),
                  decoration: BoxDecoration(
                      color: AppColor.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          image: NetworkImage(slider.image ?? ''))),
                  alignment: Alignment.center,
                );
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
                  for (int i = 0;
                      i <(productSliderModel.data?.length ?? 0);
                      i++)
                    Container(
                      margin: EdgeInsets.all(4),
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                          color: i == _currentSelectedIndex.value
                              ? AppColor.primaryColor
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.grey)),
                    )
                ],
              );
            }),
      ],
    );
  }
}
*/
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../data/models/product_slider_model.dart';
import '../../utils/app_colors.dart';

class HomeBannerSlider extends StatelessWidget {
  HomeBannerSlider({Key? key, required this.productSliderModel})
      : super(key: key);
  final ValueNotifier<int> _currentSelectedIndex = ValueNotifier(0);
  final CarouselController _carouselController = CarouselController();
  final ProductSliderModel productSliderModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
              height: 180.0,
              autoPlay: true,
              viewportFraction: 1,
              onPageChanged: (index, _) {
                _currentSelectedIndex.value = index;
              }),
          items: productSliderModel.data?.map((slider) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 1),
                  decoration: BoxDecoration(
                      color: AppColor.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          image: NetworkImage(slider.image ?? ''))),
                  alignment: Alignment.center,
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 4,
        ),
        ValueListenableBuilder(
          valueListenable: _currentSelectedIndex,
          builder: (context, updateValue, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < (productSliderModel.data?.length ?? 0); i++)
                  Container(
                    margin: const EdgeInsets.all(3),
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                        color: i == _currentSelectedIndex.value
                            ? AppColor.primaryColor
                            : null,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: i == _currentSelectedIndex.value
                                ? AppColor.primaryColor
                                : Colors.grey)),
                  )
              ],
            );
          },
        ),
      ],
    );
  }
}
