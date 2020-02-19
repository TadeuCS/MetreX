import 'dart:convert';

import 'package:MetreX/src/shared/util/Constants.dart';
import 'package:MetreX/src/shared/util/HttpUtils.dart';
import 'package:MetreX/src/ui/grupo/models/grupo_atendimento_model.dart';
import 'package:http/http.dart' as http;

class GrupoService extends HttpUtils {
  
  GrupoService(String endpoint) : super(endpoint);

  Future<List<GrupoAtendimentoModel>> listarGrupoAtendimentos() async {
    String url = "${Constants.apiUrl + endpoint}";
    return await http.get(url)
    .timeout(Constants.timeout)
    .then((response) {
      print('Status: ${response.statusCode } - ${response.reasonPhrase}');
      if(response.statusCode==200){
        List grupos = jsonDecode(utf8.decode(response.bodyBytes));
        return grupos.map((e) => GrupoAtendimentoModel.fromJson(e)).toList();
      }else{
        return List<GrupoAtendimentoModel>();
      }
    }).catchError((err){
      print('erro\n$err');
      return List<GrupoAtendimentoModel>();
    });
  }
}
