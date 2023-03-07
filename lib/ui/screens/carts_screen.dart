import 'package:craft_buy/ui/reusable_widgets/app_elevated_button.dart';
import 'package:craft_buy/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx/bottom_navigation_controller.dart';
import '../reusable_widgets/cards/card_product_item.dart';

class CartsScreen extends StatefulWidget {
  const CartsScreen({Key? key}) : super(key: key);

  @override
  State<CartsScreen> createState() => _CartsScreenState();
}

class _CartsScreenState extends State<CartsScreen> {
  BottomNavigationBarController controller =
      Get.put(BottomNavigationBarController());
  final TextEditingController productCountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: const Text(
            'Carts',
            style: TextStyle(color: Colors.black54),
          ),
          leading: IconButton(
            onPressed: () {
              controller.changeIndex(0);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black54,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return CardProductItem();
                  }),
            ),
            Container(
              padding: EdgeInsets.all(14),
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
                      width: 100,
                      child: AppElevatedBtn(text: 'CheckOut', onTap: () {}))
                ],
              ),
            )
          ],
        ));
  }
}
