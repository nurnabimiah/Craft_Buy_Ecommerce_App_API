import 'package:flutter/material.dart';

void showSnackbar(BuildContext context, String titile, [bool isError = false]) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(titile), backgroundColor: isError ? Colors.red : null));
}
