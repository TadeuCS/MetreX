// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProdutoModel _$ProdutoModelFromJson(Map<String, dynamic> json) {
  return ProdutoModel(
    idProduto: json['idProduto'] as int,
    idGrupo: json['idGrupo'] as int,
    descricao: json['descricao'] as String,
    preco: (json['preco'] as num)?.toDouble(),
    foto: json['foto'] as String,
    manualProducao: json['manualProducao'] as String,
    fracionado: json['fracionado'] as bool,
  );
}

Map<String, dynamic> _$ProdutoModelToJson(ProdutoModel instance) =>
    <String, dynamic>{
      'idProduto': instance.idProduto,
      'idGrupo': instance.idGrupo,
      'descricao': instance.descricao,
      'preco': instance.preco,
      'foto': instance.foto,
      'fracionado': instance.fracionado,
      'manualProducao': instance.manualProducao,
    };
