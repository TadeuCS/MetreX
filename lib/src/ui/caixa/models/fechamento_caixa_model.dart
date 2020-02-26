import 'package:json_annotation/json_annotation.dart';

part 'fechamento_caixa_model.g.dart';

@JsonSerializable()

class FechamentoCaixaModel {
  final int idCaixa;
  final int idUsuario;
  final int idForma;
  final String forma;
  final double valorCalculado;
  final double diferenca;
  double valorInformado;

  FechamentoCaixaModel({this.idCaixa, this.idUsuario, this.idForma, this.forma, this.valorCalculado, this.valorInformado, this.diferenca});

  factory FechamentoCaixaModel.fromJson(Map<String, dynamic> json) =>
      _$FechamentoCaixaModelFromJson(json);

  Map<String, dynamic> toJson() => _$FechamentoCaixaModelToJson(this);
}
