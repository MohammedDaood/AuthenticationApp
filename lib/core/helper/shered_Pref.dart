// lib/utils/pref_utils.dart
import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  static SharedPreferences? _prefs;
  static const String _keyOnboardingCompleted = 'onboarding_completed';

  // تهيئة مرة واحدة فقط
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool isOnboardingCompleted() {
    return _prefs?.getBool(_keyOnboardingCompleted) ?? false;
  }

  static Future<void> setOnboardingCompleted() async {
    await _prefs?.setBool(_keyOnboardingCompleted, true);
  }
}
