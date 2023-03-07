import 'package:flutter/material.dart';

import '../screens/carts_screen.dart';
import '../utils/app_colors.dart';

class CardProductItem extends StatelessWidget {
  const CardProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Product Name',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                letterSpacing: 0.4),
                          ),
                          Row(
                            children: const [
                              Text(
                                'color: black',
                                style: TextStyle(fontSize: 13),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                'size: XL',
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          )
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.delete_forever_outlined,
                            color: Colors.red,
                            size: 29,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 6,
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
                      // increment decrement er button thakbe.....
                      SizedBox(
                        height: 30,
                        width: 95,
                        child: IncDecFormFiled(
                          controller: TextEditingController(),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
