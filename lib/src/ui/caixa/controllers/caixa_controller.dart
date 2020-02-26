import 'package:MetreX/src/shared/util/OUtil.dart';
import 'package:MetreX/src/shared/util/Session.dart';
import 'package:MetreX/src/ui/caixa/models/caixa_item_model.dart';
import 'package:MetreX/src/ui/caixa/models/caixa_model.dart';
import 'package:MetreX/src/ui/caixa/models/fechamento_caixa_model.dart';
import 'package:mobx/mobx.dart';

part 'caixa_controller.g.dart';

class CaixaController = _CaixaControllerBase with _$CaixaController;

abstract class _CaixaControllerBase with Store {
  @observable
  CaixaModel caixaModel;

  @observable
  var fechamentos = ObservableList<FechamentoCaixaModel>();

  @action
  void carregarCaixa(CaixaModel caixaModel) {
    this.caixaModel = caixaModel;
  }

  @action
  void alteraFechamento(
      FechamentoCaixaModel antigo, FechamentoCaixaModel novo) {
    fechamentos.remove(antigo);
    fechamentos.add(novo);
  }

  @computed
  get valorTotalCalculado =>
      OUtil.totalizarLista(Session.caixaController.fechamentos
          .map((f) => f.valorCalculado)
          .toList());

  @computed
  get valorTotalInformado =>
      OUtil.totalizarLista(Session.caixaController.fechamentos
          .map((f) => f.valorInformado)
          .toList());

  @action
  void listarFechamentos() {
    //agrupa por forma de recebimento
    List<List<CaixaItemModel>> itensAgrupados = caixaModel.itens
        .fold<List<List<CaixaItemModel>>>(List(), (itens, itemMapeado) {
      bool agrupado = false;
      for (List<CaixaItemModel> itemAgrupado in itens) {
        if (itemAgrupado.first.forma == itemMapeado.forma) {
          itemAgrupado.add(itemMapeado);
          agrupado = true;
          break;
        }
      }

      if (!agrupado) {
        var novaLista = List<CaixaItemModel>();
        novaLista.add(itemMapeado);
        itens.add(novaLista);
      }
      return itens;
    }).toList();

    //apartir do agrupamento gera a lista de fechamentos
    var listTemp = itensAgrupados
        .map(
          (e) => FechamentoCaixaModel(
            idCaixa: caixaModel.idCaixa,
            idUsuario: caixaModel.usuario.idUsuario,
            forma: e.first.forma,
            valorCalculado: OUtil.totalizarLista(e
                .map((item) => item.tipoMovimento == 'D'
                    ? item.valor - (item.valor * 2)
                    : item.valor)
                .toList()),
            valorInformado: 0.0,
            diferenca: 0.0,
          ),
        )
        .toList();
    fechamentos.clear();
    fechamentos.addAll(listTemp);
  }
}
