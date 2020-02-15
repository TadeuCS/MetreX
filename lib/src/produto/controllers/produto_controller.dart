import 'package:MetreX/src/produto/models/grupo_atendimento_model.dart';
import 'package:MetreX/src/produto/models/produto_model.dart';
import 'package:MetreX/src/produto/services/produto_service.dart';
import 'package:mobx/mobx.dart';

part 'produto_controller.g.dart';

class ProdutoController = _ProdutoControllerBase with _$ProdutoController;

abstract class _ProdutoControllerBase with Store {
  ProdutoService produtoService = ProdutoService();

  @observable
  var gruposAtendimento = ObservableList<GrupoAtendimentoModel>();
  @observable
  var produtos = ObservableList<ProdutoModel>();
  @observable
  var produtoModel = ProdutoModel();

  @action
  void listarGrupoAtendimentos() {
    gruposAtendimento.clear();
    produtoService
        .listarGrupoAtendimentos()
        .then((gruposListados) => gruposAtendimento.addAll(gruposListados));
  }

  @action
  void listarProdutosByGrupoAtendimento(int idGrupo) {
    produtos.clear();
    produtoService
        .listarProdutosByGrupoAtendimento(idGrupo)
        .then((produtosLigados) => produtos.addAll(produtosLigados));
  }
}