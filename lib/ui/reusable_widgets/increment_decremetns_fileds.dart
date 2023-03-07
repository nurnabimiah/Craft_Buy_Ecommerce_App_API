import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class IncDecFormFiled extends StatefulWidget {
  const IncDecFormFiled({
    super.key,
  });

  @override
  State<IncDecFormFiled> createState() => _IncDecFormFiledState();
}

class _IncDecFormFiledState extends State<IncDecFormFiled> {
  final TextEditingController controller = TextEditingController();
  int currentValue = 1;
  @override
  void initState() {
    super.initState();
    controller.text = currentValue.toString();
  }

  /* void changeValue(int value) {
    currentValue = value;
    controller.text = currentValue.toString();
  }*/

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            currentValue++;
            controller.text = currentValue.toString();
          },
          child: Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(4)),
            child: const Icon(
              Icons.add,
              size: 18,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 2),
        Expanded(
          child: TextFormField(
            textAlign: TextAlign.center,
            controller: controller,
            readOnly: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none)),
          ),
        ),
        const SizedBox(width: 2),
        GestureDetector(
          onTap: () {
            if (currentValue > 1) {
              currentValue--;
            }
            controller.text = currentValue.toString();
          },
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
    );
  }
}
