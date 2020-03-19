import 'package:shared_preferences/shared_preferences.dart';

class Constants {
  // static final String servidor = 'http://192.168.100.40:8080/app'; // Renato
  // static final String servidor = 'http://192.168.100.64:8080'; // Marvin
  static final String servidor = 'http://192.168.100.71:8080'; // Tadeu
  static String apiUrl = '$servidor/services/pos/'; //Escritório
  // String _apiUrl = "http://192.168.100.6:8080/api/"; //Casa
  static final Duration duration = Duration(seconds: 1);
  static final Duration timeout = Duration(seconds: 10);
  static SharedPreferences prefs;
  

  static Map<String, String> requestHeaders = {
    'Content-Type': 'application/json'
  };

  

  Constants._privateConstructor();

  static final Constants _instance = Constants._privateConstructor();

  factory Constants() {
    return _instance;
  }
}
