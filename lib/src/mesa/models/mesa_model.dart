import 'package:flutter/cupertino.dart';

import 'item_model.dart';

class MesaModel {
  final int id;
  final String numero;
  final double total;
  List<ItemModel> itens;

  MesaModel({
    this.id,
    @required this.numero,
    this.total = 0.0,
    this.itens,
  }) {
    itens = List();
  }
}
