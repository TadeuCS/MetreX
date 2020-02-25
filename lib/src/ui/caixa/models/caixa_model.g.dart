// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caixa_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CaixaModel _$CaixaModelFromJson(Map<String, dynamic> json) {
  return CaixaModel(
    idCaixa: json['idCaixa'] as int,
    dataAbertura: json['dataAbertura'] as String,
    turno: json['turno'] as String,
    usuario: json['usuario'] == null
        ? null
        : UsuarioModel.fromJson(json['usuario'] as Map<String, dynamic>),
    entradas: (json['entradas'] as num)?.toDouble(),
    saidas: (json['saidas'] as num)?.toDouble(),
    saldo: (json['saldo'] as num)?.toDouble(),
    itens: (json['itens'] as List)
        ?.map((e) => e == null
            ? null
            : CaixaItemModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CaixaModelToJson(CaixaModel instance) =>
    <String, dynamic>{
      'idCaixa': instance.idCaixa,
      'dataAbertura': instance.dataAbertura,
      'turno': instance.turno,
      'usuario': instance.usuario,
      'entradas': instance.entradas,
      'saidas': instance.saidas,
      'saldo': instance.saldo,
      'itens': instance.itens,
    };
