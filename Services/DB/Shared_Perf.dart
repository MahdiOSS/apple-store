import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  SharedPref(this._sharedPreferences);
  final SharedPreferences _sharedPreferences;

  Future<bool> saveData<T>(dynamic data,String key) async {
    switch(T){
      case String : return await _sharedPreferences.setString(key, data);
      case int : return await _sharedPreferences.setInt(key, data);
      case double : return await _sharedPreferences.setDouble(key, data);
      case bool : return await _sharedPreferences.setBool(key, data);
      case const (List<String>) : return await _sharedPreferences.setStringList(key, data);
      default: return false;
    }
  }

  String? readToken(String key) {
    return  _sharedPreferences.getString(key);
  }

  Future<bool> removeData(String key) async {
   return await _sharedPreferences.remove(key);
  }

}