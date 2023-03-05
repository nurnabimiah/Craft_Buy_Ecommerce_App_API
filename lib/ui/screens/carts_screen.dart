import 'package:craft_buy/ui/reusable_widgets/app_textfiled_widget.dart';
import 'package:craft_buy/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx/bottom_navigation_controller.dart';

class CartsScreen extends StatefulWidget {
  const CartsScreen({Key? key}) : super(key: key);

  @override
  State<CartsScreen> createState() => _CartsScreenState();
}

class _CartsScreenState extends State<CartsScreen> {
  BottomNavigationBarController controller =
      Get.put(BottomNavigationBarController());

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
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black54,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(20),
            elevation: 3,
            child: Row(
              children: [
                const SizedBox(width: 8),
                Image.asset(
                  'assests/images/shoes.jpeg',
                  width: 90,
                  height: 70,
                  fit: BoxFit.cover,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Product Name'),
                              Text('Product Size')
                            ],
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.delete_forever_outlined,
                                color: Colors.red,
                                size: 29,
                              ))
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '\$100',
                            style: TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                          Spacer(),
                          SizedBox(
                            height: 30,
                            width: 90,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        color: AppColor.primaryColor,
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Icon(
                                      Icons.add,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 2),
                                Expanded(
                                  child: AppTextFiledWidget(
                                      hintText: '',
                                      controller: TextEditingController()),
                                ),
                                const SizedBox(width: 2),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        color: AppColor.primaryColor,
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Icon(
                                      Icons.remove,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
