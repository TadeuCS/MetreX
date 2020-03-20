// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recado_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecadoModel _$RecadoModelFromJson(Map<String, dynamic> json) {
  return RecadoModel(
    idrecado: json['idrecado'] as int,
    descricao: json['descricao'] as String,
  );
}

Map<String, dynamic> _$RecadoModelToJson(RecadoModel instance) =>
    <String, dynamic>{
      'idrecado': instance.idrecado,
      'descricao': instance.descricao,
    };
