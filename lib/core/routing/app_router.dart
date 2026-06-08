import 'package:auth_app/core/routing/routes.dart';
import 'package:auth_app/futcer/home/screens/home_screen.dart';
import 'package:auth_app/futcer/Onboarding/screens/onboarding_screen.dart';
import 'package:auth_app/futcer/login/screens/%20qr_scanner_screen.dart';
import 'package:auth_app/futcer/login/screens/login_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => onboardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.qrScannerScreen:
        return MaterialPageRoute(builder: (_) => QrScannerScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Center(child: Text('No route defined for ${settings.name}'))),
        );
    }
  }
}
