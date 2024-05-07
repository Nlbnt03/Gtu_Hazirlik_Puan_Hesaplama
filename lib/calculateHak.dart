import 'package:shared_preferences/shared_preferences.dart';

class calculateHak
{
  static const String key = 'kullanici_hak';

  static Future <int> getHesaplamaHak() async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? 0;
  }

  static Future<void> setHesaplamaHakki(int yeniHak) async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, yeniHak);
  }
}