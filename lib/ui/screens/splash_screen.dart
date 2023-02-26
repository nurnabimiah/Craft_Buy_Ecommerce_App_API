import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

//..............
class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset('assests/images/logo.png'),
            const Spacer(),
            const CircularProgressIndicator(color: Color(0xFF07ADAE)),
            const SizedBox(
              height: 14,
            ),
            const Text(
              'Version 2.0.1',
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.6),
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
