import 'package:shared_preferences/shared_preferences.dart';

class Constants {
  // static String apiUrl = "http://192.168.100.71:8080/api/"; //Serviço
  // String _apiUrl = "http://192.168.100.6:8080/api/"; //Casa
  static final Duration duration = Duration(seconds: 1);
  static final Duration timeout = Duration(seconds: 5);
  static SharedPreferences prefs;

  static final Map<String, String> requestHeaders = {
    'Content-Type': 'application/json'
  };

  Constants._privateConstructor();

  static final Constants _instance = Constants._privateConstructor();

  factory Constants() {
    return _instance;
  }
}
