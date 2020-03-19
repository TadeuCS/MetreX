
import 'package:json_annotation/json_annotation.dart';

part 'produto_model.g.dart';

@JsonSerializable()
class ProdutoModel{
  final int idProduto;
  final int idGrupo;
  final String descricao;
  final double preco;
  final bool fracionado;

  ProdutoModel({this.idProduto, this.idGrupo, this.descricao, this.preco, this.fracionado=false});

  factory ProdutoModel.fromJson(Map<String, dynamic> json) => _$ProdutoModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProdutoModelToJson(this);
}