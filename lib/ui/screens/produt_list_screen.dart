import 'package:craft_buy/ui/getx/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../reusable_widgets/product__preview_card.dart';

class ProductListScreen extends StatefulWidget {
  ///......if you want to inside product details screen
  ///.....you have to must need categoryId....

  final String categoryId;
  final String categoryName;
  const ProductListScreen(
      {Key? key, required this.categoryId, required this.categoryName})
      : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  /* BottomNavigationBarController controller =
      Get.put(BottomNavigationBarController());*/

  ProductController controller = Get.put(ProductController());

  ///........addpostFramecall back shedule kore ekta frame generate howar pore aita call back shcdule kore
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.getProductsByCategory(widget.categoryId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          widget.categoryName,
          style: TextStyle(color: Colors.black54),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
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
          child: GetBuilder<ProductController>(
            builder: (productController) {
              if (productController.productByCategoryInProgress) {
                const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if ((productController.productByCategoryModel.data?.length ??
                      0) ==
                  0) {
                return const Center(
                  child: Text('No products'),
                );
              }
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 2 / 3,
                      crossAxisCount: 3,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 6),
                  itemCount:
                      productController.productByCategoryModel.data?.length ??
                          0,
                  itemBuilder: (context, index) {
                    return ProductItemPreviewCard(
                      productData:
                          productController.productByCategoryModel.data![index],
                    );
                  });
            },
          )),
    );
  }
}
