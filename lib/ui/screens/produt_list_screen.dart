import 'package:craft_buy/ui/reusable_widgets/product__preview_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx/bottom_navigation_controller.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  BottomNavigationBarController controller =
      Get.put(BottomNavigationBarController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Product List',
          style: TextStyle(color: Colors.black54),
        ),
        leading: IconButton(
          onPressed: () {
            controller.changeIndex(0);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black54,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 5 / 6,
                crossAxisCount: 3,
                mainAxisSpacing: 4,
                crossAxisSpacing: 6),
            itemCount: 30,
            itemBuilder: (context, index) {
              return ProductItemPreviewCard();
            }),
      ),
    );
  }
}
