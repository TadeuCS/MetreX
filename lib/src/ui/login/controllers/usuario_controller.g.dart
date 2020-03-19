// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UsuarioController on _UsuarioControllerBase, Store {
  final _$usuarioModelAtom = Atom(name: '_UsuarioControllerBase.usuarioModel');

  @override
  UsuarioModel get usuarioModel {
    _$usuarioModelAtom.context.enforceReadPolicy(_$usuarioModelAtom);
    _$usuarioModelAtom.reportObserved();
    return super.usuarioModel;
  }

  @override
  set usuarioModel(UsuarioModel value) {
    _$usuarioModelAtom.context.conditionallyRunInAction(() {
      super.usuarioModel = value;
      _$usuarioModelAtom.reportChanged();
    }, _$usuarioModelAtom, name: '${_$usuarioModelAtom.name}_set');
  }

  final _$_UsuarioControllerBaseActionController =
      ActionController(name: '_UsuarioControllerBase');

  @override
  void alterarUsuario(String value) {
    final _$actionInfo = _$_UsuarioControllerBaseActionController.startAction();
    try {
      return super.alterarUsuario(value);
    } finally {
      _$_UsuarioControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void alterarSenha(String value) {
    final _$actionInfo = _$_UsuarioControllerBaseActionController.startAction();
    try {
      return super.alterarSenha(value);
    } finally {
      _$_UsuarioControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void login(BuildContext context, GlobalKey<ScaffoldState> scaffoldState) {
    final _$actionInfo = _$_UsuarioControllerBaseActionController.startAction();
    try {
      return super.login(context, scaffoldState);
    } finally {
      _$_UsuarioControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void testarConexao(GlobalKey<ScaffoldState> scaffoldState, String urlTeste) {
    final _$actionInfo = _$_UsuarioControllerBaseActionController.startAction();
    try {
      return super.testarConexao(scaffoldState, urlTeste);
    } finally {
      _$_UsuarioControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String validaUsuario(String value) {
    final _$actionInfo = _$_UsuarioControllerBaseActionController.startAction();
    try {
      return super.validaUsuario(value);
    } finally {
      _$_UsuarioControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String validaSenha(String value) {
    final _$actionInfo = _$_UsuarioControllerBaseActionController.startAction();
    try {
      return super.validaSenha(value);
    } finally {
      _$_UsuarioControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
