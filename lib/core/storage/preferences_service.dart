import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  PreferencesService(this._prefs);

  final SharedPreferences _prefs;

  bool get isOnboardingDone => _prefs.getBool('onboarding_done') ?? false;

  Future<void> setOnboardingDone() => _prefs.setBool('onboarding_done', true);
}
