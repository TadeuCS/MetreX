import 'dart:convert';

import 'package:MetreX/src/shared/util/Constants.dart';
import 'package:MetreX/src/shared/util/HttpUtils.dart';
import 'package:MetreX/src/ui/produto/models/grupo_model.dart';
import 'package:MetreX/src/ui/produto/models/produto_model.dart';
import 'package:http/http.dart' as http;

class GrupoService extends HttpUtils {
  
  GrupoService(String endpoint) : super(endpoint);

  Future<List<GrupoModel>> listarGrupoAtendimentos() async {
    String url = "${Constants.apiUrl + endpoint}";
    return await http.get(url, headers: Constants.requestHeaders)
    .timeout(Constants.timeout)
    .then((response) {
      print('Status: ${response.statusCode } - ${response.reasonPhrase}');
      if(response.statusCode==200){
        List grupos = jsonDecode(utf8.decode(response.bodyBytes));
        return grupos.map((e) => GrupoModel.fromJson(e)).toList();
      }else{
        return List<GrupoModel>();
      }
    }).catchError((err){
      print('erro\n$err');
      return List<GrupoModel>();
    });
  }

  Future<List<ProdutoModel>> listarProdutosByGrupoAtendimento(
      int idGrupo) async {
    String url = Constants.apiUrl + endpoint + idGrupo.toString();
    return await http
        .get(url, headers: Constants.requestHeaders)
        .timeout(Constants.timeout)
        .then((response) {
      if (response.statusCode == 200) {
        List produtos = jsonDecode(utf8.decode(response.bodyBytes));
        return produtos.map((e) => ProdutoModel.fromJson(e)).toList();
      } else {
        return List<ProdutoModel>();
      }
    }).catchError((err) {
      print('err\n$err');
      return List<ProdutoModel>();
    });
  }
}
