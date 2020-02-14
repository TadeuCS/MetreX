import 'dart:convert';

import 'package:MetreX/src/login/models/usuario_model.dart';
import 'package:MetreX/src/login/services/usuario_service.dart';
import 'package:MetreX/src/shared/contents/custom_alert.dart';
import 'package:MetreX/src/shared/util/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UsuarioBloc extends ChangeNotifier{
  final UsuarioService usuarioService = UsuarioService("usuario/");
  UsuarioModel usuario;
  bool alterando;

  Future login(BuildContext context, GlobalKey<ScaffoldState> scaffoldState,
      String usuario, String senha) async {
    var usuarioModel = UsuarioModel(nome: usuario, senha: senha);
    await usuarioService
        .login(jsonEncode(usuarioModel.toJson()))
        .then((response) {
      if (response.statusCode == 200) {
        this.usuario =
            UsuarioModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
        alterando = false;
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

  Future<void> editar(GlobalKey<ScaffoldState> scaffoldState) async {
    await usuarioService.editar(jsonEncode(usuario.toJson())).then((response) {
      if (response.statusCode == 200) {
        showNotification(
            duration: Constants.duration,
            color: Colors.teal,
            msg: 'Usuario alterado com Sucesso!',
            scaffoldKey: scaffoldState);
        Future.delayed(Constants.duration).then((onValue) {
          Navigator.of(scaffoldState.currentContext).pop();
        });
        alterando = false;
      } else {
        print('StatusCode:\n${response.statusCode}');
        showNotification(
            msg: 'Não foi possível alterar o Usuario!',
            scaffoldKey: scaffoldState);
      }
    }).catchError((erro) {
      print('erro ao alterar a Usuario!\n$erro');
      showNotification(
          msg: 'Erro ao conectar com o servidor!', scaffoldKey: scaffoldState);
    });
  }

  Future testarConexao(
      GlobalKey<ScaffoldState> scaffoldState, String urlTeste) async {
    urlTeste = urlTeste.trim();
    urlTeste= (urlTeste.endsWith("/") ? urlTeste : '$urlTeste/');
    await usuarioService.testarComunicacao(urlTeste).then((response) {
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
}
