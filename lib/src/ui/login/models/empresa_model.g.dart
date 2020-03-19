// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'empresa_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmpresaModel _$EmpresaModelFromJson(Map<String, dynamic> json) {
  return EmpresaModel()
    ..idEmpresa = json['idEmpresa'] as int
    ..nome = json['nome'] as String
    ..cnpj = json['cnpj'] as String
    ..parametro = json['parametro'] == null
        ? null
        : ParametroModel.fromJson(json['parametro'] as Map<String, dynamic>);
}

Map<String, dynamic> _$EmpresaModelToJson(EmpresaModel instance) =>
    <String, dynamic>{
      'idEmpresa': instance.idEmpresa,
      'nome': instance.nome,
      'cnpj': instance.cnpj,
      'parametro': instance.parametro,
    };
