

import 'package:MetreX/src/shared/util/OUtil.dart';
import 'package:MetreX/src/ui/produto/models/grupo_atendimento_model.dart';
import 'package:MetreX/src/ui/produto/models/produto_model.dart';
import 'package:MetreX/src/ui/produto/services/produto_service.dart';
import 'package:mobx/mobx.dart';

part 'produto_controller.g.dart';

class ProdutoController = _ProdutoControllerBase with _$ProdutoController;

abstract class _ProdutoControllerBase with Store {

  ProdutoService produtoService = ProdutoService();

  @observable
  var gruposAtendimento = ObservableList<GrupoAtendimentoModel>();
  @observable
  var produtosListados = ObservableList<ProdutoModel>();
  @observable
  var produtosFiltrados = ObservableList<ProdutoModel>();
  @observable
  var produtoModel = ProdutoModel();
  @observable
  var grupoModel = GrupoAtendimentoModel();

  @action
  void listarGrupoAtendimentos() {
    gruposAtendimento.clear();
    produtoService
        .listarGrupoAtendimentos()
        .then((gruposListados) => gruposAtendimento.addAll(gruposListados));
  }

  @action
  void listarProdutosByGrupoAtendimento() {
    produtosListados.clear();
    produtoService
        .listarProdutosByGrupoAtendimento(grupoModel.idGrupo)
        .then((produtosLigados) => produtosListados.addAll(produtosLigados));
  }

  @action
  void filtraProdutosListados(String filtro) {
    produtosFiltrados=produtosListados
        .where((p) => OUtil.isNumeric(filtro)
                ? p.idProduto == int.parse(filtro)
                : p.descricao
                    .toString()
                    .toLowerCase()
                    .contains(filtro.toLowerCase()))
        .toList();
  }
  
}
