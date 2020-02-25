import 'package:json_annotation/json_annotation.dart';

part 'caixa_item_model.g.dart';

@JsonSerializable()
class CaixaItemModel {
  final int idCaixaItem;
  final String dataHora;
  final String historico;
  final String tipoMovimento;
  final String tipo;
  final double valor;
  final String forma;
  final int idUsuario;

  CaixaItemModel(
      {this.idCaixaItem,
      this.dataHora,
      this.historico,
      this.tipoMovimento,
      this.tipo,
      this.valor,
      this.forma,
      this.idUsuario});

  factory CaixaItemModel.fromJson(Map<String, dynamic> json) =>
      _$CaixaItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$CaixaItemModelToJson(this);
}
