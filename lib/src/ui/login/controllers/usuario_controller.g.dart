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

  final _$loginAsyncAction = AsyncAction('login');

  @override
  Future<void> login(
      BuildContext context, GlobalKey<ScaffoldState> scaffoldState) {
    return _$loginAsyncAction.run(() => super.login(context, scaffoldState));
  }

  final _$editarAsyncAction = AsyncAction('editar');

  @override
  Future<void> editar(GlobalKey<ScaffoldState> scaffoldState) {
    return _$editarAsyncAction.run(() => super.editar(scaffoldState));
  }
}
