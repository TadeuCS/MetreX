import 'dart:async';
import 'dart:convert';

import 'package:MetreX/src/shared/util/Constants.dart';
import 'package:MetreX/src/shared/util/HttpUtils.dart';
import 'package:MetreX/src/ui/login/models/usuario_model.dart';
import 'package:http/http.dart' as http;

class UsuarioService extends HttpUtils {
  UsuarioService(String endpoint) : super(endpoint);

  Future<http.Response> login(UsuarioModel usuarioModel) async {
    url = '${Constants.apiUrl + endpoint}login/';
    print('$url');
    var userJson = jsonEncode(usuarioModel);
    print(userJson);
    var response = await http
        .post(url, body: userJson, headers: Constants.requestHeaders)
        .timeout(Constants.timeout);
    print('${response.statusCode} - ${response.reasonPhrase}');
    return response;
  }

  Future<http.Response> recover(String dataJson) async {
    url = Constants.apiUrl + endpoint;
    url = '${url + endpoint}recover/';
    print('$url');
    var response = await http
        .post(url, body: dataJson, headers: Constants.requestHeaders)
        .timeout(Constants.timeout);
    print(response.statusCode);
    return response;
  }

  Future<http.Response> testarComunicacao(String url) async {
    print('$url');
    var response = await http
        .get(url, headers: Constants.requestHeaders)
        .timeout(Constants.timeout);
    print(response.statusCode);
    return response;
  }
}
