import 'package:auth_app/helper/shered_Pref.dart';
import 'package:auth_app/presentation/screens/home_screen.dart';
import 'package:auth_app/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final isCompleted = await PrefUtils.isOnboardingCompleted();

  runApp(MyApp(isCompleted: isCompleted));
}

class MyApp extends StatelessWidget {
  final bool isCompleted;

  const MyApp({super.key, required this.isCompleted});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Cairo'),
      debugShowCheckedModeBanner: false,
      home: isCompleted ? const HomeScreen() : const OnboardingScreen(),
    );
  }
}
