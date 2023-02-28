import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    super.key,
    required this.CategoryItemName,
    required this.icon,
    required this.onTap,
  });

  final String CategoryItemName;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColor.primaryColor.withOpacity(0.16)),
              child: Icon(
                icon,
                color: AppColor.primaryColor,
                size: 40,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              CategoryItemName,
              style: TextStyle(
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.6),
            )
          ],
        ),
      ),
    );
  }
}
