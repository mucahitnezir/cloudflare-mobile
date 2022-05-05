import 'package:shared_preferences/shared_preferences.dart';

import 'package:cloudflare_mobile/core/constants/enums/locale_keys.dart';

class LocaleManager {
  static final LocaleManager _instance = LocaleManager._init();

  static LocaleManager get instance => _instance;

  SharedPreferences? _preferences;

  LocaleManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }

  static Future initPreferences() async {
    instance._preferences ??= await SharedPreferences.getInstance();
  }

  Future<void> clearAll() async {
    await _preferences!.clear();
  }

  Future<void> setString(LocaleKeys key, String value) async {
    await _preferences!.setString(key.toString(), value);
  }

  String? getString(LocaleKeys key) => _preferences!.getString(key.toString());

  Future<bool> remove(LocaleKeys key) => _preferences!.remove(key.toString());
}
