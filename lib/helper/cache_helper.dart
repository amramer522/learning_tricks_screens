import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper
{
  static late SharedPreferences _prefs;

  // static to call the method direct with the class name
  static Future<void> init()async{
    // _ private variable in the file
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveCountNumber(int value)async
  {
    await _prefs.setInt("counter", value);
  }

 static int readCounter(){
    // if null
    return _prefs.getInt("counter")??0;
  }

}