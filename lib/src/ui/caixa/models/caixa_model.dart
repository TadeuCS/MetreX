import 'package:MetreX/src/ui/caixa/models/caixa_item_model.dart';
import 'package:MetreX/src/ui/login/models/usuario_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'caixa_model.g.dart';

@JsonSerializable()

class CaixaModel {
  final int idCaixa;
  final String dataAbertura;
  final String turno;
  final UsuarioModel usuario;
  final double entradas;
  final double saidas;
  final double saldo;
  final List<CaixaItemModel> itens; 

  CaixaModel({this.idCaixa, this.dataAbertura, this.turno, this.usuario, this.entradas, this.saidas, this.saldo, this.itens});

  factory CaixaModel.fromJson(Map<String, dynamic> json) =>
      _$CaixaModelFromJson(json);

  Map<String, dynamic> toJson() => _$CaixaModelToJson(this);
}
