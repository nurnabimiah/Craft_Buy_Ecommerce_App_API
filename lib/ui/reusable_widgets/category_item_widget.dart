import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    Key? key,
    required this.categoryItemName,
    required this.onTap,
    required this.image,
  }) : super(key: key);

  final String categoryItemName;
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColor.primaryColor.withOpacity(0.15)),
                child: Image.network(
                  image,
                  height: 30,
                  width: 30,
                )),
            const SizedBox(
              height: 6,
            ),
            Text(
              categoryItemName,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppColor.primaryColor,
                  letterSpacing: 0.5),
            )
          ],
        ),
      ),
    );
  }
}
