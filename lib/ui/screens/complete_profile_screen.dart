import 'package:craft_buy/ui/screens/main_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../reusable_widgets/app_elevated_button.dart';
import '../reusable_widgets/app_textfiled_widget.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 46),
                Image.asset(
                  'assests/images/logo.png',
                  width: 120,
                  fit: BoxFit.scaleDown,
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Complete Profile",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "Get Started With us with your details",
                  style: TextStyle(
                      color: Color(0XFFa6a6a6),
                      letterSpacing: 0.5,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 16,
                ),

                ///............first name......
                AppTextFiledWidget(
                  controller: TextEditingController(),
                  hintText: 'First Name',
                ),
                const SizedBox(
                  height: 16,
                ),
                AppTextFiledWidget(
                  controller: TextEditingController(),
                  hintText: 'Last Name',
                ),
                const SizedBox(
                  height: 16,
                ),
                AppTextFiledWidget(
                  controller: TextEditingController(),
                  hintText: 'Mobile',
                ),
                const SizedBox(
                  height: 16,
                ),
                AppTextFiledWidget(
                  controller: TextEditingController(),
                  hintText: 'City',
                ),
                const SizedBox(
                  height: 16,
                ),
                AppTextFiledWidget(
                  maxLine: 4,
                  controller: TextEditingController(),
                  hintText: 'Shipping address',
                ),
                const SizedBox(
                  height: 16,
                ),
                AppElevatedBtn(
                  text: 'Complete',
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainBottomNavigationBar()),
                        (route) => false);
                    /*Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VerifyOtpScreen()));*/
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
