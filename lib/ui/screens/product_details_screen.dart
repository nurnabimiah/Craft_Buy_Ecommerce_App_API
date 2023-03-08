import 'package:carousel_slider/carousel_controller.dart';
import 'package:craft_buy/ui/reusable_widgets/increment_decremetns_fileds.dart';
import 'package:craft_buy/ui/reusable_widgets/product_details/product_image_slider.dart';
import 'package:craft_buy/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../reusable_widgets/app_elevated_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final CarouselController _carouselController = CarouselController();
  final ValueNotifier<int> _currentSelectedIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(
          color: Colors.black54,
        ),
        title: const Text(
          'Product Details',
          style: TextStyle(color: Colors.black54),
        ),
        elevation: 1,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProductImageSlider(
                      carouselController: _carouselController,
                      currentSelectedIndex: _currentSelectedIndex),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Expanded(
                                child: Text(
                              'Nike Sports Shoe a47683',
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            )),

                            /// when it will rendering flex , it will do wrap with sizebox
                            SizedBox(
                                height: 50,
                                width: 90,
                                child: IncDecFormFiled()),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Text('4.5'),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Reviews',
                                  style:
                                      TextStyle(color: AppColor.primaryColor),
                                )),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: AppColor.primaryColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                                size: 14,
                              ),
                            )
                          ],
                        ),
                        const Text(
                          'Color',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black54,
                              fontWeight: FontWeight.w500),
                        ),

                        ///....................color.....................
                        Row(
                          children: [
                            for (int i = 0; i < 5; i++)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: AppColor.primaryColor,
                                  child: Icon(Icons.check),
                                ),
                              )
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),

                        ///....................size..............

                        const Text(
                          'Size',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black54,
                              fontWeight: FontWeight.w500),
                        ),

                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            for (int i = 0; i < 5; i++)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black54, width: 2),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Text('XL'),
                                ),
                              )
                          ],
                        ),

                        ///.....................description........

                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          'Description',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black54,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          'With the online text generator you can process your personal Lorem Ipsum enriching it with html elements that define its structure, with the possibility to insert external links, but not only.',
                          style: TextStyle(fontSize: 14, letterSpacing: 0.4),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
                color: AppColor.primaryColor.withOpacity(0.2),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Total Price',
                      style: TextStyle(color: Colors.black54, fontSize: 12),
                    ),
                    Text(
                      '\$12000',
                      style: TextStyle(
                          fontSize: 15,
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                    width: 120,
                    child: AppElevatedBtn(text: 'Add to Cart', onTap: () {}))
              ],
            ),
          )
        ],
      ),
    );
  }
}
