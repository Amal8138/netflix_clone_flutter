import 'package:api/common/colors.dart';
import 'package:api/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Netflix Clone',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        scaffoldBackgroundColor: kBlackColor,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: 24
          ),
          bodyMedium: TextStyle(
            color: Colors.white,
            fontSize: 20
          )
        ),
        fontFamily: GoogleFonts.ptSans().fontFamily,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
