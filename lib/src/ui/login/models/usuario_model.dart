

class UsuarioModel {
  int idUsuario;
  String usuario;
  String senha;
  String email;
  bool ativo;

  UsuarioModel(
      {this.idUsuario, this.usuario, this.senha, this.email, this.ativo});

  UsuarioModel.fromJson(Map<String, dynamic> json) {
    idUsuario = json['idUsuario'];
    usuario = json['nome'];
    senha = json['senha'];
    email = json['email'];
    ativo = json['ativo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idUsuario'] = this.idUsuario;
    data['nome'] = this.usuario;
    data['senha'] = this.senha;
    data['email'] = this.email;
    data['ativo'] = this.ativo;
    return data;
  }
}