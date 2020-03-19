
import 'package:MetreX/src/ui/login/models/parametro_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'empresa_model.g.dart';

@JsonSerializable()
class EmpresaModel{
  int idEmpresa;
  String nome;
  String cnpj;
  ParametroModel parametro;

  EmpresaModel();

  factory EmpresaModel.fromJson(Map<String, dynamic> json) =>
      _$EmpresaModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmpresaModelToJson(this);
}