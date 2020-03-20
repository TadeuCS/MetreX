import 'package:json_annotation/json_annotation.dart';

part 'recado_model.g.dart';

@JsonSerializable()
class RecadoModel {
  final int idrecado;
  final String descricao;

  RecadoModel(
      {this.idrecado,
      this.descricao});

  factory RecadoModel.fromJson(Map<String, dynamic> json) =>
      _$RecadoModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecadoModelToJson(this);
}
