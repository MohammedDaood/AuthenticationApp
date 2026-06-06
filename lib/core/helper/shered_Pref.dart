// lib/utils/pref_utils.dart
import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  static const String _keyOnboardingCompleted = 'onboarding_completed';

  static Future<bool> isOnboardingCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyOnboardingCompleted) ?? false;
  }

  static Future<void> setOnboardingCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyOnboardingCompleted, true);
  }
}
