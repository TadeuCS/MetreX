import 'package:MetreX/src/ui/login/models/empresa_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'usuario_model.g.dart';

@JsonSerializable()
class UsuarioModel {
  int idUsuario;
  String usuario;
  String nome;
  String senha;
  String foto;
  String email;
  int caixaCorrente;
  String perfil;
  bool ativo;
  EmpresaModel empresa;

  UsuarioModel({this.usuario, this.senha, this.email, this.ativo});

  factory UsuarioModel.fromJson(Map<String, dynamic> json) =>
      _$UsuarioModelFromJson(json);

  Map<String, dynamic> toJson() => _$UsuarioModelToJson(this);
}
