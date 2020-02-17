import 'package:flutter/cupertino.dart';

class ItemModel{
  final int idProduto;
  final String descricao;
  final double qtde;
  final double preco;
  double total;
  final String recado;
  final bool cancelado;
  final int idUsuario;

  ItemModel({@required this.idProduto, @required this.descricao, @required this.qtde, @required this.preco, this.total, this.recado, this.cancelado, this.idUsuario}){
    this.total=this.qtde*this.preco;
  }

}