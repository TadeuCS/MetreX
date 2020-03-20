import 'package:MetreX/src/ui/produto/models/produto_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'grupo_model.g.dart';

@JsonSerializable()
class GrupoModel {
  final int idGrupo;
  final String imagem;
  final String descricao;
  final List<ProdutoModel> produtos;

  GrupoModel({this.idGrupo, this.imagem, this.descricao, this.produtos});

  factory GrupoModel.fromJson(Map<String, dynamic> json) =>
      _$GrupoModelFromJson(json);

  Map<String, dynamic> toJson() => _$GrupoModelToJson(this);
}
