// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mesa_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MesaModel _$MesaModelFromJson(Map<String, dynamic> json) {
  return MesaModel(
    idEmpresa: json['idEmpresa'] as int,
    idMesa: json['idMesa'] as int,
    idUsuario: json['idUsuario'] as int,
    numeroMesa: json['numeroMesa'] as String,
    situacao: json['situacao'] as String,
    valorTotal: (json['valorTotal'] as num)?.toDouble(),
    pedidoCorrente: json['pedidoCorrente'] as int,
  );
}

Map<String, dynamic> _$MesaModelToJson(MesaModel instance) => <String, dynamic>{
      'idEmpresa': instance.idEmpresa,
      'idMesa': instance.idMesa,
      'idUsuario': instance.idUsuario,
      'numeroMesa': instance.numeroMesa,
      'situacao': instance.situacao,
      'valorTotal': instance.valorTotal,
      'pedidoCorrente': instance.pedidoCorrente,
    };
