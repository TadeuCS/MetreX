import 'dart:async';

import 'package:MetreX/src/shared/util/Session.dart';
import 'package:MetreX/src/ui/mesa/models/mesa_model.dart';
import 'package:MetreX/src/ui/mesa/services/mesa_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'mesa_controller.g.dart';

class MesaController = _MesaControllerBase with _$MesaController;

abstract class _MesaControllerBase with Store {
  MesaService mesaService = MesaService('mesa/');

  bool verificandoMesas = false;

  @observable
  MesaModel mesaModel;

  @observable
  var mesas = ObservableList<MesaModel>();

  @observable
  var mesasFiltradas = ObservableList<MesaModel>();

  @action
  void abrirMesa(String numeroMesa) {
    var novaMesa = MesaModel(
        idUsuario: Session.usuarioController.usuarioModel.idUsuario,
        numeroMesa: numeroMesa,
        idEmpresa: Session.usuarioController.usuarioModel.empresa.idEmpresa);
    mesaService.abrirMesa(novaMesa).then((mesaSalva) {
      if (mesaSalva != null) {
        mesaModel = mesaSalva;
        mesas.add(mesaModel);
      }
    });
  }

  @action
  void listarTodas() {
    int timeout =
        Session.usuarioController.usuarioModel.empresa.parametro.timeoutMesas;
    timeout = 1000;
    print('TimeoutMesas: $timeout');

    Timer.periodic(Duration(milliseconds: timeout), (timer) {
      mesas.clear();
      mesaService
          .listarTodas()
          .then((mesasListadas) => mesas.addAll(mesasListadas));
      mesasFiltradas = mesas;
      print("Atualizei as mesas");
    });
  }

  @action
  void filtrar(String text) {
    mesasFiltradas.clear();
    mesasFiltradas
        .addAll(mesas.where((e) => e.numeroMesa.startsWith(text)).toList());
  }
}
