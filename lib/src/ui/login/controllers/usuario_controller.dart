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
  final UsuarioService usuarioService = UsuarioService("/");

  @observable
  var usuarioModel = UsuarioModel(usuario: 'administrador', senha: 'olivetadmin');

  @action
  Future<void> login(
      BuildContext context, GlobalKey<ScaffoldState> scaffoldState) async {
    await usuarioService.login(usuarioModel).then((response) {
      if (response.statusCode == 200) {
        this.usuarioModel =
            UsuarioModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
        Navigator.pushReplacementNamed(context, 'home');
      } else {
        showNotification(
            scaffoldKey: scaffoldState, msg: 'Erro ao conectar no servidor!');
      }
    }
    ).catchError((onError) {
      print(onError);
      showNotification(
          scaffoldKey: scaffoldState, msg: 'Erro ao conectar no servidor!');
    });
  }

  @action
  Future<void> editar(GlobalKey<ScaffoldState> scaffoldState) async {
    await usuarioService
        .editar(jsonEncode(usuarioModel.toJson()))
        .then((response) {
      if (response.statusCode == 200) {
        showNotification(
            duration: Constants.duration,
            color: Colors.teal,
            msg: 'Usuario alterado com Sucesso!',
            scaffoldKey: scaffoldState);
        Future.delayed(Constants.duration).then((onValue) {
          Navigator.of(scaffoldState.currentContext).pop();
        });
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
    urlTeste = (urlTeste.endsWith("/") ? urlTeste : '$urlTeste/');
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
