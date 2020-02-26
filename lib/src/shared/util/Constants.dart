import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Constants {
  // static final String servidor = 'http://192.168.100.40:8080/app'; // Renato
  static final String servidor = 'http://192.168.100.64:8080'; // Marvin
  // static final String servidor = 'http://192.168.100.71:8080/app'; // Tadeu
  static String apiUrl = '$servidor/services/ticket/'; //Escritório
  // String _apiUrl = "http://192.168.100.6:8080/api/"; //Casa
  static final Duration duration = Duration(seconds: 1);
  static final Duration timeout = Duration(seconds: 10);
  static SharedPreferences prefs;

  static final Map<String, String> requestHeaders = {
    'Content-Type': 'application/json'
  };

  static final moneyMask =
    MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: '.');

  Constants._privateConstructor();

  static final Constants _instance = Constants._privateConstructor();

  factory Constants() {
    return _instance;
  }
}
