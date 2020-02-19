import 'package:MetreX/src/ui/grupo/models/grupo_atendimento_model.dart';
import 'package:MetreX/src/ui/grupo/services/grupo_service.dart';
import 'package:mobx/mobx.dart';
part 'grupo_controller.g.dart';

class GrupoController = _GrupoControllerBase with _$GrupoController;

abstract class _GrupoControllerBase with Store {
  GrupoService grupoService = GrupoService("grupos/");

    @observable
  var gruposAtendimento = ObservableList<GrupoAtendimentoModel>();

  @observable
  var grupoModel = GrupoAtendimentoModel();

  @action
  void listarGrupoAtendimentos() {
    gruposAtendimento.clear();
    grupoService
        .listarGrupoAtendimentos()
        .then((gruposListados) => gruposAtendimento.addAll(gruposListados));
  }
}

