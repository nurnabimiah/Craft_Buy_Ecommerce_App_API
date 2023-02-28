import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class AppElevatedBtn extends StatelessWidget {
  const AppElevatedBtn({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.all(14),
              backgroundColor: AppColor.primaryColor),
          onPressed: onTap,
          child: Text(text)),
    );
  }
}
