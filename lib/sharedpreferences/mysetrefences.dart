import 'package:shared_preferences/shared_preferences.dart';

class mysharedpreferences {
  static mysharedpreferences _instance;
  static Future<mysharedpreferences> getInstancemypref() async {
    if (_instance == null) {
      _instance = mysharedpreferences();
    }
  }

  SharedPreferences prefs;
  saveReference(String key, value) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String> getReference(String key) async {
    prefs = await SharedPreferences.getInstance();
    String stringValue = prefs.getString(key);
    return stringValue ?? null;
  }
}
