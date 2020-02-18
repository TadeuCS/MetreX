import 'dart:convert';

import 'package:MetreX/src/shared/util/Constants.dart';
import 'package:MetreX/src/shared/util/HttpUtils.dart';
import 'package:MetreX/src/ui/pedido/models/pedido_model.dart';
import 'package:http/http.dart' as http;

class PedidoService extends HttpUtils{

  PedidoService(String endpoint) : super(endpoint);

  Future<PedidoModel> getPedido(int idPedido) async {
    String url = "${Constants.apiUrl+endpoint}$idPedido";
    return await http
        .get(url)
        .timeout(Constants.timeout)
        .then((response) {
      if (response.statusCode == 200) {
        return json.decode(utf8.decode(response.bodyBytes));
      } else {
        return null;
      }
    }).catchError((err) {
      print(err);
      return null;
    });
  }
}
