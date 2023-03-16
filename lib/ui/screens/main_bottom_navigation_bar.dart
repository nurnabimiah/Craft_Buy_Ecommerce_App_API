import 'package:craft_buy/ui/getx/product_controller.dart';
import 'package:craft_buy/ui/screens/carts_screen.dart';
import 'package:craft_buy/ui/screens/home_screen.dart';
import 'package:craft_buy/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx/bottom_navigation_controller.dart';
import '../getx/categoryl_list_controller.dart';
import '../getx/home_screen_controller.dart';
import 'categories_screen.dart';

class MainBottomNavigationBar extends StatefulWidget {
  const MainBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<MainBottomNavigationBar> createState() =>
      _MainBottomNavigationBarState();
}

class _MainBottomNavigationBarState extends State<MainBottomNavigationBar> {
  ///..........all of things we controll from this page
  /// ...........it is our main bottom...poge.....
  /// we used to get x from this page
  ///  aita aikhane asar sobida holo circular progress indicator ta ekabar ei show hobe
  ///  second kono page a gele seita r show hobe na

  /// ...........getx..........

  BottomNavigationBarController controller =
      Get.put(BottomNavigationBarController());

  HomeController homeController = Get.put(HomeController());

  CategoryListController categoryListController =
      Get.put(CategoryListController());
  ProductController productController = Get.put(ProductController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      homeController.getProductSliderList();
      categoryListController.getCategories();
      productController.getPopularProducts();
      productController.getSpecialProducts();
      productController.getNewProducts();
    });
  }

  final List<Widget> screens = const [
    HomeScreen(),
    ProductcategoryScreen(),
    CartsScreen(),
    //WishListScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BottomNavigationBarController>(builder: (controller) {
        return screens[controller.selectedIndex];
      }),
      bottomNavigationBar:
          GetBuilder<BottomNavigationBarController>(builder: (_) {
        return BottomNavigationBar(
          currentIndex: controller.selectedIndex,
          selectedItemColor: AppColor.primaryColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          onTap: (index) {
            controller.changeIndex(index);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Category'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(Icons.card_giftcard), label: 'Wish'),
          ],
        );
      }),
    );
  }
}
