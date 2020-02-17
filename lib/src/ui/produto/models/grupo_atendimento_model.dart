class GrupoAtendimentoModel {
  int idGrupo;
  String imagem;
  String descricao;

  GrupoAtendimentoModel({this.idGrupo, this.descricao, this.imagem});

  GrupoAtendimentoModel.fromJson(Map<String, dynamic> json) {
    this.idGrupo = json["idGrupo"];
    this.imagem = json["imagem"];
    this.descricao = json["descricao"];
  }
}
