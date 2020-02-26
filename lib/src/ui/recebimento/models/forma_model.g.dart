// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forma_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FormaModel _$FormaModelFromJson(Map<String, dynamic> json) {
  return FormaModel(
    idForma: json['idForma'] as int,
    forma: json['forma'] as String,
    descricao: json['descricao'] as String,
  );
}

Map<String, dynamic> _$FormaModelToJson(FormaModel instance) =>
    <String, dynamic>{
      'idForma': instance.idForma,
      'forma': instance.forma,
      'descricao': instance.descricao,
    };
