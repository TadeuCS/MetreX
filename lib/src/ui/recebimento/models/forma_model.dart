import 'package:json_annotation/json_annotation.dart';

part 'forma_model.g.dart';

@JsonSerializable()

class FormaModel {
  final int idForma;
  final String forma;
  final String descricao;

  FormaModel({this.idForma, this.forma, this.descricao});

  factory FormaModel.fromJson(Map<String, dynamic> json) =>
      _$FormaModelFromJson(json);

  Map<String, dynamic> toJson() => _$FormaModelToJson(this);
}
