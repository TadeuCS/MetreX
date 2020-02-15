class ProdutoModel{
  int idProduto;
  int idGrupo;
  String descricao;
  double preco;

  ProdutoModel();

  ProdutoModel.fromJson(Map<String, dynamic> json){
    this.idProduto=json["idProduto"];
    this.idGrupo=json["idGrupo"];
    this.descricao=json["descricao"];
    this.preco=json["preco"];
  }
}