import 'package:craft_buy/ui/reusable_widgets/category_item_widget.dart';
import 'package:flutter/material.dart';

class ProductcategoryScreen extends StatefulWidget {
  const ProductcategoryScreen({Key? key}) : super(key: key);

  @override
  State<ProductcategoryScreen> createState() => _ProductcategoryScreenState();
}

class _ProductcategoryScreenState extends State<ProductcategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Categories',
          style: TextStyle(color: Colors.black54),
        ),
        backgroundColor: Colors.white,
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, mainAxisSpacing: 2),
          itemCount: 10,
          itemBuilder: (context, index) {
            return CategoryItemWidget(
              categoryItemName: 'Bike',
              icon: Icons.directions_bike,
              onTap: () {},
            );
          }),
    );
  }
}
