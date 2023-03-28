import 'package:craft_buy/ui/getx/auth_controller.dart';
import 'package:craft_buy/ui/screens/verify_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../reusable_widgets/app_elevated_button.dart';
import '../reusable_widgets/app_textfiled_widget.dart';

class EmailAuthScreen extends StatefulWidget {
  const EmailAuthScreen({Key? key}) : super(key: key);

  @override
  State<EmailAuthScreen> createState() => _EmailAuthScreenState();
}

class _EmailAuthScreenState extends State<EmailAuthScreen> {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController _emailEditingController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
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
                    ///......resusable widget...
                    controller: _emailEditingController,
                    hintText: 'Email',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GetBuilder<AuthController>(builder: (controller) {
                    if (controller.sendVerificationCodeToEmailInProgress) {
                      Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return AppElevatedBtn(
                      text: 'Next',
                      onTap: () {
                        authController
                            .sendVerificationCodeToEmail(
                                _emailEditingController.text.trim())
                            .then((value) => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VerifyOtpScreen())));

                        /**/
                      },
                    );
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
