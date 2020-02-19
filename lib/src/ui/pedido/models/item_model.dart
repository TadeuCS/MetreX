import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_model.g.dart';

@JsonSerializable()

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

  factory ItemModel.fromJson(Map<String, dynamic> json) => _$ItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);
}