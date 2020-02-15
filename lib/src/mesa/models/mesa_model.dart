import 'package:flutter/cupertino.dart';

class MesaModel {
  int idEmpresa;
  int idMesa;
  String numeroMesa;
  String situacao;
  double valorTotal;
  int pedidoCorrente;

  MesaModel(
      {@required this.numeroMesa,
      this.situacao = 'Aberta',
      this.valorTotal = 0.0});

  MesaModel.fromJson(Map<String, dynamic> json) {
    this.idEmpresa = json["idEmpresa"];
    this.idMesa = json["idMesa"];
    this.numeroMesa = json["numeroMesa"];
    this.situacao = json["situacao"];
    this.valorTotal = json["valorTotal"];
    this.pedidoCorrente = json["pedidoCorrente"];
  }
}
