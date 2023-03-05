import 'package:craft_buy/ui/screens/carts_screen.dart';
import 'package:craft_buy/ui/screens/home_screen.dart';
import 'package:craft_buy/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx/bottom_navigation_controller.dart';
import 'categories_screen.dart';

class MainBottomNavigationBar extends StatefulWidget {
  const MainBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<MainBottomNavigationBar> createState() =>
      _MainBottomNavigationBarState();
}

class _MainBottomNavigationBarState extends State<MainBottomNavigationBar> {
  BottomNavigationBarController controller =
      Get.put(BottomNavigationBarController());
  final List<Widget> screens = const [
    HomeScreen(),
    ProductcategoryScreen(),
    CartsScreen(),
    HomeScreen(),
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
