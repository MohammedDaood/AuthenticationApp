import 'package:auth_app/core/helper/shered_Pref.dart';
import 'package:auth_app/core/routing/app_router.dart';
import 'package:auth_app/core/routing/routes.dart';
import 'package:auth_app/futcer/auth_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final isCompleted = await PrefUtils.isOnboardingCompleted();

  final initialRoute = isCompleted
      ? Routes.loginScreen
      : Routes.onboardingScreen;

  runApp(AuthApp(appRouter: AppRouter(), initialRoute: initialRoute));
}
