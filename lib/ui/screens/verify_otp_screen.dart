import 'package:craft_buy/ui/getx/auth_controller.dart';
import 'package:craft_buy/ui/reusable_widgets/snackbar_widget.dart';
import 'package:craft_buy/ui/screens/complete_profile_screen.dart';
import 'package:craft_buy/ui/screens/main_bottom_navigation_bar.dart';
import 'package:craft_buy/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../reusable_widgets/app_elevated_button.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String email;
  const VerifyOtpScreen({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController _otpTextEdittingController =
      TextEditingController();
  AuthController authController = Get.put(AuthController());
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
                "Enter OTP code",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "A 4 digits numbers sent to your email",
                style: TextStyle(
                    color: Color(0XFFa6a6a6), letterSpacing: 0.5, fontSize: 16),
              ),
              const SizedBox(
                height: 16,
              ),
              PinCodeTextField(
                controller: _otpTextEdittingController,
                length: 4,
                obscureText: false,
                animationType: AnimationType.fade,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    selectedColor: AppColor.primaryColor),
                animationDuration: Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
                //errorAnimationController: errorController,
                //controller: textEditingController,
                onCompleted: (v) {},
                onChanged: (value) {},
                beforeTextPaste: (text) {
                  return true;
                },
                appContext: context,
              ),
              const SizedBox(
                height: 16,
              ),
              GetBuilder<AuthController>(builder: (controller) {
                if (controller.verifyOtpInProgress) {
                  Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return AppElevatedBtn(
                  text: 'Next',
                  onTap: () {
                    controller
                        .verifyOtp(
                            widget.email, _otpTextEdittingController.text)
                        .then((result) {
                      if (result) {
                        authController.readProfileDetails().then((value) {
                          if (value) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MainBottomNavigationBar()),
                                (route) => false);
                          } else {
                            // if you are not verified user, we navigate to complete profile screen
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CompleteProfileScreen()),
                                (route) => false);
                          }
                        });
                      } else {
                        showSnackbar(
                            context, 'oTp Verification is failed ! Try Again');
                      }
                    });
                  },
                );
              }),
              const SizedBox(
                height: 16,
              ),
              RichText(
                text: const TextSpan(
                    text: 'this code will expire in  ',
                    style: TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(
                          text: '120s',
                          style: TextStyle(color: Color(0xFF07ADAE)))
                    ]),
              ),
              const SizedBox(
                height: 16,
              ),
              TextButton(onPressed: () {}, child: const Text('Resend code'))
            ],
          ),
        ),
      ),
    ));
  }
}
