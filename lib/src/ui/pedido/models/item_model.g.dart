// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) {
  return ItemModel(
    idProduto: json['idProduto'] as int,
    descricao: json['descricao'] as String,
    qtde: (json['qtde'] as num)?.toDouble(),
    preco: (json['preco'] as num)?.toDouble(),
    total: (json['total'] as num)?.toDouble(),
    recado: json['recado'] as String,
    cancelado: json['cancelado'] as bool,
    idUsuario: json['idUsuario'] as int,
  );
}

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
      'idProduto': instance.idProduto,
      'descricao': instance.descricao,
      'qtde': instance.qtde,
      'preco': instance.preco,
      'total': instance.total,
      'recado': instance.recado,
      'cancelado': instance.cancelado,
      'idUsuario': instance.idUsuario,
    };
