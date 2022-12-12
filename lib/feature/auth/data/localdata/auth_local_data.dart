import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  static late SharedPreferences _pref;
  static Future<void> init() async =>
      _pref = await SharedPreferences.getInstance();
  static Future<void> cacheUserData({
    required String phone,
    required String apiToken,
    required int uid,
  }) async {
    await _pref.setString('phone', phone);
    await _pref.setString('apiToken', apiToken);
    await _pref.setInt('uid', uid);
  }

  static bool get isLogged => _pref.containsKey('apiToken');
  static String get apiToken => _pref.getString('apiToken')!;
  static String get phone => _pref.getString('phone')!;
  static int get uid => _pref.getInt('uid')!;
}
