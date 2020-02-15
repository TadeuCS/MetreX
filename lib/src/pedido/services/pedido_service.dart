import 'dart:convert';

import 'package:MetreX/src/pedido/models/pedido_model.dart';
import 'package:MetreX/src/shared/util/Constants.dart';
import 'package:http/http.dart' as http;

class PedidoService {
  String _url = "${Constants}ticket/";

  Future<PedidoModel> getPedido(int idPedido) async {
    return await http
        .get("${_url}pedido/$idPedido")
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
