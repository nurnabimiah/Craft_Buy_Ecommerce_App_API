import 'package:craft_buy/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class ProductItemPreviewCard extends StatelessWidget {
  const ProductItemPreviewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProductDetailsScreen()));
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        margin: EdgeInsets.zero,
        child: Column(
          children: [
            Image.network(
              'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/0ae7e10a-8dca-4017-b9ed-edd2dc6276cd/air-jordan-1-low-womens-shoes-6LXJdg.png',
              height: 100,
              width: 160,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 6,
            ),
            const Text(
              'Product Name',
              maxLines: 2,
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  letterSpacing: 0.4,
                  overflow: TextOverflow.ellipsis),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$200',
                  style: TextStyle(color: AppColor.primaryColor),
                ),
                const SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.star,
                  color: Colors.amberAccent,
                  size: 22,
                ),
                Text(
                  '4.5',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  width: 8,
                ),
                GestureDetector(
                    onTap: () {},
                    child: Container(
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColor.primaryColor),
                        child: Icon(
                          Icons.favorite_border,
                          size: 14,
                          color: Colors.white,
                        )))
              ],
            ),
            const SizedBox(
              height: 8,
            )
          ],
        ),
      ),
    );
  }
}
