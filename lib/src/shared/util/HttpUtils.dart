import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'Constants.dart';

class HttpUtils {

  String url;
  final String endpoint;

  HttpUtils(this.endpoint);

  Future<Response> listarTodos() async {
    url = Constants.prefs.getString("url");
    url = '$url$endpoint';
    print(url);
    var response = await http.get(url, headers: Constants.requestHeaders).timeout(Constants.timeout);
    print('${response.statusCode} - ${response.reasonPhrase}');
    return response;
  }

  Future<Response> salvar(String bodyJson) async {
    url = Constants.prefs.getString("url");
    url = '$url$endpoint';
    print(url);
    var response = await http.post(url,
        body: bodyJson, headers: Constants.requestHeaders).timeout(Constants.timeout);
    print('${response.statusCode} - ${response.reasonPhrase}');
    return response;
  }

  Future<Response> editar(String bodyJson) async {
    url = Constants.prefs.getString("url");
    url = '$url$endpoint';
    print(url);
    var response = await http.put(url,
        body: bodyJson, headers: Constants.requestHeaders).timeout(Constants.timeout);
    print('${response.statusCode} - ${response.reasonPhrase}');
    return response;
  }


  Future<Response> apagar(String id) async {
    url = Constants.prefs.getString("url");
    url = '$url$endpoint';
    print('$url$id');
    var response = await http.delete('$url$id', headers: Constants.requestHeaders).timeout(Constants.timeout);
    print('${response.statusCode} - ${response.reasonPhrase}');
    return response;
  }
  // Future<Response> apagar(String bodyJson) async {
  //   print(url);
  //   var client = http.Client();
  //    try {
  //     var response = await client.send(http.Request("DELETE", Uri.parse(url))
  //       ..headers['Content-Type'] = 'application/json'
  //       ..body = bodyJson);
  //     print(response.statusCode);
  //     return Response.fromStream(response);
  //   } catch (e) {
  //     print(e);
  //     return null;
  //   } finally {
  //     client.close();
  //   }
  // }
}
