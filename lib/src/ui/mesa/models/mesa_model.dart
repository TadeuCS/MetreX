import 'package:json_annotation/json_annotation.dart';

part 'mesa_model.g.dart';

@JsonSerializable()

class MesaModel {
  final int idEmpresa;
  final int idMesa;
  final int idUsuario;
  final String numeroMesa;
  final String situacao;
  final double valorTotal;
  final int pedidoCorrente;

  MesaModel({this.idEmpresa=1, this.idMesa, this.idUsuario=1, this.numeroMesa, this.situacao, this.valorTotal=0.0, this.pedidoCorrente});

  factory MesaModel.fromJson(Map<String, dynamic> json) => _$MesaModelFromJson(json);

  Map<String, dynamic> toJson() => _$MesaModelToJson(this);
}
