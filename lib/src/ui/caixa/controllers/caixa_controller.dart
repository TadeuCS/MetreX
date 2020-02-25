import 'package:MetreX/src/ui/caixa/models/caixa_model.dart';
import 'package:mobx/mobx.dart';
part 'caixa_controller.g.dart';

class CaixaController = _CaixaControllerBase with _$CaixaController;

abstract class _CaixaControllerBase with Store {
  @observable
  CaixaModel caixaModel;

  @action
  void carregarCaixa(CaixaModel caixaModel){
    this.caixaModel = caixaModel;
  }
}
