import 'package:craft_buy/ui/getx/categoryl_list_controller.dart';
import 'package:craft_buy/ui/reusable_widgets/category_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx/bottom_navigation_controller.dart';

class ProductcategoryScreen extends StatefulWidget {
  const ProductcategoryScreen({Key? key}) : super(key: key);

  @override
  State<ProductcategoryScreen> createState() => _ProductcategoryScreenState();
}

class _ProductcategoryScreenState extends State<ProductcategoryScreen> {
  BottomNavigationBarController controller =
      Get.put(BottomNavigationBarController());
  CategoryListController categoryListController =
      Get.put(CategoryListController());

  @override
  void initState() {
    categoryListController.getCategories();

    super.initState();
  }

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
      body: GetBuilder<CategoryListController>(
        builder: (controller) {
          if (controller.getCategoryInprogress) {
            Center(
              child: CircularProgressIndicator(),
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              controller.getCategories();
            },
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, mainAxisSpacing: 2),
                itemCount: controller.categoryListModel.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return CategoryItemWidget(
                    categoryItemName: controller
                            .categoryListModel.data![index].categoryName ??
                        '',
                    image:
                        controller.categoryListModel.data![index].categoryImg ??
                            '',
                    onTap: () {},
                  );
                }),
          );
        },
      ),
    );
  }
}
