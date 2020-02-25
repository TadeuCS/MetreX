// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caixa_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CaixaItemModel _$CaixaItemModelFromJson(Map<String, dynamic> json) {
  return CaixaItemModel(
    idCaixaItem: json['idCaixaItem'] as int,
    dataHora: json['dataHora'] as String,
    historico: json['historico'] as String,
    tipoMovimento: json['tipoMovimento'] as String,
    tipo: json['tipo'] as String,
    valor: (json['valor'] as num)?.toDouble(),
    forma: json['forma'] as String,
    idUsuario: json['idUsuario'] as int,
  );
}

Map<String, dynamic> _$CaixaItemModelToJson(CaixaItemModel instance) =>
    <String, dynamic>{
      'idCaixaItem': instance.idCaixaItem,
      'dataHora': instance.dataHora,
      'historico': instance.historico,
      'tipoMovimento': instance.tipoMovimento,
      'tipo': instance.tipo,
      'valor': instance.valor,
      'forma': instance.forma,
      'idUsuario': instance.idUsuario,
    };
