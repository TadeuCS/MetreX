// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grupo_atendimento_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GrupoAtendimentoModel _$GrupoAtendimentoModelFromJson(
    Map<String, dynamic> json) {
  return GrupoAtendimentoModel(
    idGrupo: json['idGrupo'] as int,
    descricao: json['descricao'] as String,
    imagem: json['imagem'] as String,
    produtos: (json['produtos'] as List)
        ?.map((e) =>
            e == null ? null : ProdutoModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GrupoAtendimentoModelToJson(
        GrupoAtendimentoModel instance) =>
    <String, dynamic>{
      'idGrupo': instance.idGrupo,
      'descricao': instance.descricao,
      'imagem': instance.imagem,
      'produtos': instance.produtos?.map((e) => e?.toJson())?.toList(),
    };
