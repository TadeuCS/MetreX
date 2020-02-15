import 'dart:convert';
import 'package:MetreX/src/shared/util/Constants.dart';
import 'package:http/http.dart' as http;

import 'package:MetreX/src/mesa/models/mesa_model.dart';

class MesaService {
  Future<List<MesaModel>> listarTodas() async {
    return await http.get("${Constants.apiUrl}ticket/mesas/")
    .timeout(Constants.timeout)
    .then((response) {
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

  Future<MesaModel> abrirMesa(MesaModel mesaModel) async{
    return await http.post('${Constants.apiUrl}ticket/mesas/abrir/', 
    headers: Constants.requestHeaders, 
    body: json.encode(mesaModel)).timeout(Constants.timeout)
    .then((response){
      if(response.hashCode==200){
        return json.decode(utf8.decode(response.bodyBytes));
      }else{
        return null;
      }
    }).catchError((err){
      print(err);
      return null;
    });
  }
}
