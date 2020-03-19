// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parametro_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParametroModel _$ParametroModelFromJson(Map<String, dynamic> json) {
  return ParametroModel()
    ..idParametro = json['idParametro'] as int
    ..taxaServico = (json['taxaServico'] as num)?.toDouble()
    ..timeoutMesas = json['timeoutMesas'] as int
    ..timeMesasSemAtendimentos = json['timeMesasSemAtendimentos'] as int;
}

Map<String, dynamic> _$ParametroModelToJson(ParametroModel instance) =>
    <String, dynamic>{
      'idParametro': instance.idParametro,
      'taxaServico': instance.taxaServico,
      'timeoutMesas': instance.timeoutMesas,
      'timeMesasSemAtendimentos': instance.timeMesasSemAtendimentos,
    };
