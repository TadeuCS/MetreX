import 'package:MetreX/src/ui/grupo/models/grupo_atendimento_model.dart';
import 'package:MetreX/src/ui/produto/models/produto_model.dart';
import 'package:MetreX/src/ui/produto/services/produto_service.dart';
import 'package:mobx/mobx.dart';

part 'produto_controller.g.dart';

class ProdutoController = _ProdutoControllerBase with _$ProdutoController;

abstract class _ProdutoControllerBase with Store {
  ProdutoService produtoService = ProdutoService("produtos/");

  @observable
  var produtosListados = ObservableList<ProdutoModel>();
  @observable
  var produtosFiltrados = ObservableList<ProdutoModel>();
  @observable
  var produtoModel = ProdutoModel();

  @action
  void listarProdutosByGrupoAtendimento(GrupoAtendimentoModel grupo) {
    // produtosListados.clear();
    produtoService
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
          .where(
              (p) => p.descricao.toUpperCase().contains(filtro.toUpperCase()))
          .toList());
  }
}
