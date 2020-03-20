import 'dart:async';

import 'package:MetreX/src/shared/util/Session.dart';
import 'package:MetreX/src/ui/mesa/models/mesa_model.dart';
import 'package:MetreX/src/ui/mesa/services/mesa_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'mesa_controller.g.dart';

class MesaController = _MesaControllerBase with _$MesaController;

abstract class _MesaControllerBase with Store {
  final MesaService mesaService = MesaService('mesa/');

  Timer timer;

  @observable
  MesaModel mesaModel;

  @observable
  var mesasFiltradas = ObservableList<MesaModel>();

  List<MesaModel> _mesas;

  @action
  void abrirMesa(String numeroMesa, BuildContext context) {
    var novaMesa = MesaModel(
        idUsuario: Session.usuarioController.usuarioModel.idUsuario,
        numeroMesa: numeroMesa,
        idEmpresa: Session.usuarioController.usuarioModel.empresa.idEmpresa);
    mesaService.abrirMesa(novaMesa).then((mesaSalva) {
      if (mesaSalva != null) {
        mesaModel = mesaSalva;
        if (!_mesas.contains(mesaSalva)) {
          _mesas.add(mesaSalva);
        }
        Navigator.pushNamed(context, 'detalharMesa');
      }
    });
  }

  @action
  void listarTodas() {
    // startSchedule();
    mesaService.listarTodas().then((mesasListadas) {
      _mesas = mesasListadas;
      filtrar('');
      print("Atualizei as mesas");
    });
  }

  @action
  void filtrar(String text) {
    mesasFiltradas.clear();
    mesasFiltradas
        .addAll(_mesas.where((e) => e.numeroMesa.startsWith(text)).toList());
  }

  // void setDataTeste() {
  //   Session.pedidoController.pedido.itens.add(ItemModel(
  //       idProduto: 1, descricao: "Coca Cola 350ml", qtde: 2, preco: 5));
  //   Session.pedidoController.pedido.itens.add(ItemModel(
  //       idProduto: 1, descricao: "Chopp Brahma 500ml", qtde: 3, preco: 9.5));
  //   Session.pedidoController.pedido.itens.add(ItemModel(
  //       idProduto: 1, descricao: "Coca Cola 350ml", qtde: 2, preco: 5));
  //   Session.pedidoController.pedido.itens.add(ItemModel(
  //       idProduto: 1, descricao: "Chopp Brahma 500ml", qtde: 3, preco: 9.5));
  //   Session.pedidoController.pedido.itens.add(ItemModel(
  //       idProduto: 1, descricao: "Coca Cola 350ml", qtde: 2, preco: 5));
  //   Session.pedidoController.pedido.itens.add(ItemModel(
  //       idProduto: 1, descricao: "Chopp Brahma 500ml", qtde: 3, preco: 9.5));
  //   Session.pedidoController.pedido.itens.add(ItemModel(
  //       idProduto: 1, descricao: "Coca Cola 350ml", qtde: 2, preco: 5));
  //   Session.pedidoController.pedido.itens.add(ItemModel(
  //       idProduto: 1, descricao: "Chopp Brahma 500ml", qtde: 3, preco: 9.5));
  // }

  // startSchedule() {
  //   print('Startei o schedule');
  //   int timeout =
  //       Session.usuarioController.usuarioModel.empresa.parametro.timeoutMesas;
  //   print('TimeoutMesas: $timeout');
  //   timeout = 10000; //atualiza para 10 segundo

  //   timer = Timer.periodic(Duration(milliseconds: timeout), (timer) {});
  // }
}
