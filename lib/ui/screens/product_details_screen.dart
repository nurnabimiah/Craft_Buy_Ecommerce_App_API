import 'package:carousel_slider/carousel_controller.dart';
import 'package:craft_buy/ui/reusable_widgets/increment_decremetns_fileds.dart';
import 'package:craft_buy/ui/reusable_widgets/product_details/product_image_slider.dart';
import 'package:flutter/material.dart';

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
          ProductImageSlider(
              carouselController: _carouselController,
              currentSelectedIndex: _currentSelectedIndex),
          Row(
            children: const [
              Text('Nike Sports Shoe a47683'),
              Spacer(),

              /// when it will rendering flex , it will do wrap with sizebox
              SizedBox(height: 50, width: 50, child: IncDecFormFiled()),
            ],
          )
        ],
      ),
    );
  }
}
