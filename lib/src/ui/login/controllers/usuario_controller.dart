import 'dart:convert';

import 'package:MetreX/src/shared/contents/custom_alert.dart';
import 'package:MetreX/src/shared/util/Constants.dart';
import 'package:MetreX/src/ui/login/models/usuario_model.dart';
import 'package:MetreX/src/ui/login/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'usuario_controller.g.dart';

class UsuarioController = _UsuarioControllerBase with _$UsuarioController;

abstract class _UsuarioControllerBase with Store {
  final UsuarioService usuarioService = UsuarioService("usuario/");
  static String token;

  @observable
  UsuarioModel usuarioModel;

  @action
  void alterarUsuario(String value) => usuarioModel.usuario = value;

  @action
  void alterarSenha(String value) => usuarioModel.senha = value;

  @action
  void login(BuildContext context, GlobalKey<ScaffoldState> scaffoldState) {
    usuarioService.login(usuarioModel).then((response) {
      if (response.statusCode == 200) {
        Constants.prefs.setString("usuario", this.usuarioModel.usuario);
        Constants.prefs.setString("senha", this.usuarioModel.senha);
        token = jsonDecode(utf8.decode(response.bodyBytes))['access_token'];
        convertTokenToUsuario();
        Navigator.pushReplacementNamed(context, 'home');
      } else {
        showNotification(
            scaffoldKey: scaffoldState, msg: utf8.decode(response.bodyBytes));
      }
    }).catchError((onError) {
      print(onError);
      showNotification(
          scaffoldKey: scaffoldState, msg: 'Erro ao conectar no servidor!');
    });
  }

  @action
  void testarConexao(GlobalKey<ScaffoldState> scaffoldState, String urlTeste) {
    urlTeste = urlTeste.trim();
    urlTeste = (urlTeste.endsWith("/") ? urlTeste : '$urlTeste/');
    usuarioService.testarComunicacao(urlTeste).then((response) {
      if (response.statusCode == 200) {
        print('Conectei!');
        showNotification(
            color: Colors.teal,
            msg: 'Conexão estabelecida com sucesso!',
            scaffoldKey: scaffoldState);
        return true;
      } else {
        print('StatusCode:\n${response.statusCode}');
        String msg = 'Erro ao Conectar no Servidor!';
        showNotification(msg: msg, scaffoldKey: scaffoldState);
        return false;
      }
    }).catchError((erro) {
      String msg = 'Erro ao Conectar no Servidor!';
      print('$msg\n$erro');
      showNotification(msg: msg, scaffoldKey: scaffoldState);
      return false;
    });
  }

  void convertTokenToUsuario() {
    print('Token: $token');
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    Constants.requestHeaders=header;

    final parts = token.split('.');
    final payload = parts[1];
    // print('Payload: $payload');
    final String normalized = base64Url.normalize(payload);
    var resp = utf8.decode(base64Url.decode(normalized));
    // print('Payload Decoded: $resp');
    var userJson = jsonDecode(resp)['sub'];
    this.usuarioModel = UsuarioModel.fromJson(jsonDecode(userJson));
  }

  @action
  String validaUsuario(String value) =>
      value.trim().isEmpty ? 'Informe o Usuário' : null;

  @action
  String validaSenha(String value) =>
      value.trim().isEmpty ? 'Informe a Senha' : null;

  bool validaLoginSalvo() {
    return Constants.prefs.containsKey("usuario") &&
        Constants.prefs.containsKey("senha");
  }
}
