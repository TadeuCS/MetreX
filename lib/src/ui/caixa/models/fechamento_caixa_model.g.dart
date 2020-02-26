// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fechamento_caixa_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FechamentoCaixaModel _$FechamentoCaixaModelFromJson(Map<String, dynamic> json) {
  return FechamentoCaixaModel(
    idCaixa: json['idCaixa'] as int,
    idUsuario: json['idUsuario'] as int,
    idForma: json['idForma'] as int,
    forma: json['forma'] as String,
    valorCalculado: (json['valorCalculado'] as num)?.toDouble(),
    valorInformado: (json['valorInformado'] as num)?.toDouble(),
    diferenca: (json['diferenca'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$FechamentoCaixaModelToJson(
        FechamentoCaixaModel instance) =>
    <String, dynamic>{
      'idCaixa': instance.idCaixa,
      'idUsuario': instance.idUsuario,
      'idForma': instance.idForma,
      'forma': instance.forma,
      'valorCalculado': instance.valorCalculado,
      'diferenca': instance.diferenca,
      'valorInformado': instance.valorInformado,
    };
