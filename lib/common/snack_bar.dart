import 'package:flutter/material.dart';

void showSnackBarWidget(BuildContext context , String messages) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(messages),
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 3),
      )
    );
}