import 'dart:async';

import 'package:MetreX/src/shared/util/Constants.dart';
import 'package:MetreX/src/shared/util/HttpUtils.dart';
import 'package:http/http.dart' as http;

class UsuarioService extends HttpUtils {
  String url;
  String endpoint;

  UsuarioService(String endpoint) : super(endpoint){
    this.endpoint=endpoint;
  }

  Future<http.Response> login(String dataJson) async {
    url = Constants.prefs.getString("url");
    url = '$url$endpoint';
    print('${url}login/');
    var response = await http
        .post('${url}login/', body: dataJson, headers: Constants.requestHeaders)
        .timeout(Constants.timeout);
    print(response.statusCode);
    return response;
  }

  Future<http.Response> recover(String dataJson) async {
    url = Constants.prefs.getString("url");
    url = '$url$endpoint';
    print('${url}recover/');
    var response = await http
        .post('${url}recover/',
            body: dataJson, headers: Constants.requestHeaders)
        .timeout(Constants.timeout);
    print(response.statusCode);
    return response;
  }

  Future<http.Response> testarComunicacao(String url) async {
    print('$url');
    var response = await http
        .get('$url', headers: Constants.requestHeaders)
        .timeout(Constants.timeout);
    print(response.statusCode);
    return response;
  }
}
