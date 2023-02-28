import 'package:flutter/material.dart';

class AppTextFiledWidget extends StatelessWidget {
  const AppTextFiledWidget({
    super.key,
    required this.hintText,
    required this.controller,
    this.maxLine,
  });

  final String hintText;
  final TextEditingController controller;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLine ?? 1,

      ///er mane holo jodi null thake dore nibo er maxline holo 1
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: Colors.white,
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF07ADAE)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF07ADAE)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF07ADAE)),
        ),
      ),
    );
  }
}
