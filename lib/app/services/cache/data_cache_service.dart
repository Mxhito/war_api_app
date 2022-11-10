import 'package:shared_preferences/shared_preferences.dart';

class DataCacheService {
  static late SharedPreferences _sharedPreferences;

  static const _dayOfWarKey = 'dayOfWar';

  static Future<void> init() async =>
      _sharedPreferences = await SharedPreferences.getInstance();

  //! Написать метод для кэширования всех данных
  static Future<void> setDay(int dayOfWar) async =>
      await _sharedPreferences.setInt(_dayOfWarKey, dayOfWar);

  static int? getDay() => _sharedPreferences.getInt(_dayOfWarKey);
}
