import 'package:MetreX/src/ui/mesa/models/mesa_model.dart';
import 'package:MetreX/src/ui/mesa/services/mesa_service.dart';
import 'package:mobx/mobx.dart';
part 'mesa_controller.g.dart';

class MesaController = _MesaControllerBase with _$MesaController;

abstract class _MesaControllerBase with Store {
  MesaService mesaService = MesaService('mesas/');

  @observable
  MesaModel mesaModel;

  @observable
  var mesas = ObservableList<MesaModel>();

  @observable
  var mesasFiltradas = ObservableList<MesaModel>();

  @action
  void abrirMesa() {
    mesaService.abrirMesa(mesaModel).then((mesaSalva) {
      if (mesaSalva.idMesa != null) {
        mesaModel = mesaSalva;
      }
    });
  }

  @action
  void listarTodas() {
    mesaService
        .listarTodas()
        .then((mesasListadas) => mesas.addAll(mesasListadas));
    mesasFiltradas = mesas;
  }

  @action
  void filtrar(String text) {
    mesasFiltradas = mesas.where((e) => e.numeroMesa.startsWith(text)).toList();
  }
}
