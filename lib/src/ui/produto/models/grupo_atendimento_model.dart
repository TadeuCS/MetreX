import 'package:MetreX/src/ui/produto/models/produto_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'grupo_atendimento_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GrupoAtendimentoModel {
  final int idGrupo;
  final String descricao;
  final String imagem;
  final List<ProdutoModel> produtos;

  GrupoAtendimentoModel({this.idGrupo, this.descricao, this.imagem, this.produtos});

  factory GrupoAtendimentoModel.fromJson(Map<String, dynamic> json) =>
      _$GrupoAtendimentoModelFromJson(json);

  Map<String, dynamic> toJson() => _$GrupoAtendimentoModelToJson(this);
}
