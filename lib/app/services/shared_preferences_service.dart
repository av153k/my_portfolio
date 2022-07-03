import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  SharedPrefsService._();
  static final SharedPrefsService _instance = SharedPrefsService._();
  static SharedPrefsService get instance => _instance;
  SharedPreferences? prefs;

  Future<void> initialize() async {
    prefs = await SharedPreferences.getInstance();
  }

  setString(String key, String value) async {
    prefs?.setString(key, value);
  }

  String? getString(String key) {
    return prefs?.getString(key);
  }

  setInt(String key, int value) async {
    await prefs?.setInt(key, value);
  }

  int? getInt(String key) {
    return prefs?.getInt(key);
  }

  setBool(String key, bool value) async {
    await prefs?.setBool(key, value);
  }

  bool? getBool(String key) {
    return prefs?.getBool(key);
  }

  setDouble(String key, double value) async {
    await prefs?.setDouble(key, value);
  }

  double? getDouble(String key) {
    return prefs?.getDouble(key);
  }

  setList(String key, List<String> value) async {
    await prefs?.setStringList(key, value);
  }

  List<String>? getList(String key) {
    return prefs?.getStringList(key);
  }

  remove(String key) async {
    await prefs?.remove(key);
  }

  clear() async {
    await prefs?.clear();
  }
}

class SharedPrefsKeys {
  static const String themeMode = 'themeMode';
}
