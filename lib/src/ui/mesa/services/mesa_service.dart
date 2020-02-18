import 'dart:convert';
import 'package:MetreX/src/shared/util/Constants.dart';
import 'package:MetreX/src/shared/util/HttpUtils.dart';
import 'package:MetreX/src/ui/mesa/models/mesa_model.dart';
import 'package:http/http.dart' as http;

class MesaService extends HttpUtils {
  MesaService(String endpoint) : super(endpoint);

  Future<List<MesaModel>> listarTodas() async {
    String url = "${Constants.apiUrl + endpoint}";
    return await http.get(url).timeout(Constants.timeout).then((response) {
      if (response.statusCode == 200) {
        List lista = json.decode(response.body);
        return lista.map((e) => MesaModel.fromJson(e)).toList();
      } else {
        return List();
      }
    }).catchError((err) {
      print(err);
      return List();
    });
  }

  Future<MesaModel> abrirMesa(MesaModel mesaModel) async {
    String url = '${Constants.apiUrl + endpoint}abrir/';
    return await http
        .post(url,
            headers: Constants.requestHeaders, body: json.encode(mesaModel.toJson()))
        .timeout(Constants.timeout)
        .then((response) {
      if (response.hashCode == 200) {
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
