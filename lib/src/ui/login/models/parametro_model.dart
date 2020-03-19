
import 'package:json_annotation/json_annotation.dart';

part 'parametro_model.g.dart';

@JsonSerializable()
class ParametroModel{
  int idParametro;
  double taxaServico;
  int timeoutMesas;
  int timeMesasSemAtendimentos;

  ParametroModel();

  factory ParametroModel.fromJson(Map<String, dynamic> json) =>
      _$ParametroModelFromJson(json);

  Map<String, dynamic> toJson() => _$ParametroModelToJson(this);
}