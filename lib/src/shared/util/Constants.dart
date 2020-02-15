import 'package:shared_preferences/shared_preferences.dart';

class Constants {
  static final String servidor = 'http://192.168.100.40:8080/app';
  static final String apiUrl = '$servidor/services/'; //Escritório
  // String _apiUrl = "http://192.168.100.6:8080/api/"; //Casa
  static final Duration duration = Duration(seconds: 1);
  static final Duration timeout = Duration(seconds: 10);
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
