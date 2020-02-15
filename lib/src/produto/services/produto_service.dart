import 'dart:convert';

import 'package:MetreX/src/produto/models/grupo_atendimento_model.dart';
import 'package:MetreX/src/produto/models/produto_model.dart';
import 'package:MetreX/src/shared/util/Constants.dart';
import 'package:http/http.dart' as http;

class ProdutoService{
  String _url = "${Constants}ticket/";

  Future<List<GrupoAtendimentoModel>> listarGrupoAtendimentos() async {
    var response = await http.get("${_url}grupos/");
    List<GrupoAtendimentoModel> grupos = List();
    if (response.statusCode == 200) {
      for (var item in jsonDecode(response.body)) {
        grupos.add(GrupoAtendimentoModel.fromJson(item));
      }
    }
    return grupos;
  }

  Future<List<ProdutoModel>> listarProdutosByGrupoAtendimento(int idGrupo) async {
    var response = await http
        .get("${_url}produtos/${idGrupo == null ? "" : idGrupo.toString()}");
    List<ProdutoModel> produtos = List();
    if (response.statusCode == 200) {
      for (var item in jsonDecode(response.body)) {
        produtos.add(ProdutoModel.fromJson(item));
      }
    }
    return produtos;
  }
}