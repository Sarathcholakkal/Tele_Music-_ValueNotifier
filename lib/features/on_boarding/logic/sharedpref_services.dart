import 'package:shared_preferences/shared_preferences.dart';

class SharedprefServices {
  static late final SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  // Save a name
  static Future<void> saveName(String name) async {
    await prefs.setString("name", name);
  }

  // Get the stored name
  static String? getName() {
    return prefs.getString("name");
  }

  // Check if a name is stored
  static bool isNameStored() {
    var checkName = getName();
    return checkName != null && checkName.isNotEmpty;
  }

  static Future<void> clearAll() async {
    await prefs.clear();
  }
}
