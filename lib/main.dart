import 'package:craft_buy/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

//route Mangement use korar khetre amra getMaterial ta use kori
// stateManagement er khetre eita dorkar hoy na
main() {
  runApp(const CraftyBayApp());
}

class CraftyBayApp extends StatefulWidget {
  // context k globally use korar jonno amra navigator key ta niye si
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  const CraftyBayApp({Key? key}) : super(key: key);

  @override
  State<CraftyBayApp> createState() => _CraftyBayAppState();
}

class _CraftyBayAppState extends State<CraftyBayApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: CraftyBayApp.navigatorKey,
      home: const SplashScreen(),
    );
  }
}
