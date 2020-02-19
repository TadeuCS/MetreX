import 'dart:convert';

import 'package:MetreX/src/shared/util/Constants.dart';
import 'package:MetreX/src/shared/util/HttpUtils.dart';
import 'package:MetreX/src/ui/produto/models/produto_model.dart';
import 'package:http/http.dart' as http;

class ProdutoService extends HttpUtils {
  ProdutoService(String endpoint) : super(endpoint);

  Future<List<ProdutoModel>> listarProdutosByGrupoAtendimento(
      int idGrupo) async {
    String url =
        "${Constants.apiUrl + endpoint + (idGrupo == null ? '' : idGrupo.toString())}";
    return await http.get(url).timeout(Constants.timeout).then((response) {
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
