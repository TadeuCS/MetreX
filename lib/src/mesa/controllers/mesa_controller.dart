import 'package:MetreX/src/mesa/models/mesa_model.dart';
import 'package:mobx/mobx.dart';
part 'mesa_controller.g.dart';

class MesaController = _MesaControllerBase with _$MesaController;

abstract class _MesaControllerBase with Store {
  @observable
  MesaModel mesaModel;

}