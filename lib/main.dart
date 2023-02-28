import 'package:craft_buy/ui/screens/email_auth_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CraftBuyHomePage());
}

class CraftBuyHomePage extends StatelessWidget {
  const CraftBuyHomePage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Craft Buy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EmailAuthScreen(),
    );
  }
}
