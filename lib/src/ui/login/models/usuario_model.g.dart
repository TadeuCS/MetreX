// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsuarioModel _$UsuarioModelFromJson(Map<String, dynamic> json) {
  return UsuarioModel(
    usuario: json['usuario'] as String,
    senha: json['senha'] as String,
    email: json['email'] as String,
    ativo: json['ativo'] as bool,
  )
    ..idUsuario = json['idUsuario'] as int
    ..nome = json['nome'] as String
    ..foto = json['foto'] as String
    ..caixaCorrente = json['caixaCorrente'] as int
    ..perfil = json['perfil'] as String
    ..empresa = json['empresa'] == null
        ? null
        : EmpresaModel.fromJson(json['empresa'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UsuarioModelToJson(UsuarioModel instance) =>
    <String, dynamic>{
      'idUsuario': instance.idUsuario,
      'usuario': instance.usuario,
      'nome': instance.nome,
      'senha': instance.senha,
      'foto': instance.foto,
      'email': instance.email,
      'caixaCorrente': instance.caixaCorrente,
      'perfil': instance.perfil,
      'ativo': instance.ativo,
      'empresa': instance.empresa,
    };
