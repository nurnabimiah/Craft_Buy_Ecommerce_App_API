import 'package:flutter/material.dart';

import '../reusable_widgets/app_elevated_button.dart';
import '../reusable_widgets/app_textfiled_widget.dart';

class EmailAuthScreen extends StatefulWidget {
  const EmailAuthScreen({Key? key}) : super(key: key);

  @override
  State<EmailAuthScreen> createState() => _EmailAuthScreenState();
}

class _EmailAuthScreenState extends State<EmailAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 52),
                Image.asset(
                  'assests/images/logo.png',
                  width: 120,
                  fit: BoxFit.scaleDown,
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Welcome Back !",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "Please Enter Your Email Address",
                  style: TextStyle(
                      color: Color(0XFFa6a6a6),
                      letterSpacing: 0.5,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 16,
                ),
                AppTextFiledWidget(
                  controller: TextEditingController(),
                  hintText: 'Email',
                ),
                const SizedBox(
                  height: 16,
                ),
                AppElevatedBtn(
                  text: 'Next',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
