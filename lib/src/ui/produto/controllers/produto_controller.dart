import 'package:MetreX/src/ui/produto/models/grupo_atendimento_model.dart';
import 'package:MetreX/src/ui/produto/models/produto_model.dart';
import 'package:MetreX/src/ui/produto/models/recado_model.dart';
import 'package:MetreX/src/ui/produto/services/grupo_service.dart';
import 'package:MetreX/src/ui/produto/services/produto_service.dart';
import 'package:MetreX/src/ui/produto/services/recado_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'produto_controller.g.dart';

class ProdutoController = _ProdutoControllerBase with _$ProdutoController;

abstract class _ProdutoControllerBase with Store {
  final ProdutoService produtoService = ProdutoService('produto/');
  final GrupoService grupoService = GrupoService("grupo/");
  final RecadoService recadoService = RecadoService('recado/');

  @observable
  var produtosListados = ObservableList<ProdutoModel>();

  @observable
  var produtosFiltrados = ObservableList<ProdutoModel>();

  @observable
  var produtoModel = ProdutoModel();

  @observable
  var gruposAtendimento = ObservableList<GrupoAtendimentoModel>();

  @observable
  var grupoModel = GrupoAtendimentoModel();

  @observable
  var recados = ObservableList<RecadoModel>();

  

  @action
  void listarGrupoAtendimentos() {
    gruposAtendimento.clear();
    grupoService
        .listarGrupoAtendimentos()
        .then((gruposListados) => gruposAtendimento.addAll(gruposListados));
  }

  @action
  void listarProdutosByGrupoAtendimento(GrupoAtendimentoModel grupo) {
    grupoService
        .listarProdutosByGrupoAtendimento(grupo.idGrupo)
        .then((produtos) {
      produtosListados.clear();
      produtosListados.addAll(produtos);
      produtosFiltrados.clear();
      produtosFiltrados.addAll(produtos);
    });
  }

  @action
  void filtraProdutosListados(String filtro) {
    produtosFiltrados.clear();
    produtosFiltrados.addAll(produtosListados
        .where((p) => p.descricao.toUpperCase().contains(filtro.toUpperCase()))
        .toList());
  }

  @action
  void carregarProduto(ProdutoModel produtoSelecionado, BuildContext context) {
    this.produtoModel = produtoSelecionado;
    carregaRecados(produtoModel);
    Navigator.pushNamed(context, "item");
  }

  @action
  void carregaRecados(ProdutoModel produtoSelecionado) {
    recadoService
        .listarRecadosByProduto(produtoSelecionado.idGrupo)
        .then((recados) => recados.addAll(recados));
  }

  bool temManualProducao() {
    return produtoModel.manualProducao != null &&
        produtoModel.manualProducao.isNotEmpty;
  }
}
