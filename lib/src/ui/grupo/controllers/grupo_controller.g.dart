// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grupo_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GrupoController on _GrupoControllerBase, Store {
  final _$gruposAtendimentoAtom =
      Atom(name: '_GrupoControllerBase.gruposAtendimento');

  @override
  ObservableList<GrupoAtendimentoModel> get gruposAtendimento {
    _$gruposAtendimentoAtom.context.enforceReadPolicy(_$gruposAtendimentoAtom);
    _$gruposAtendimentoAtom.reportObserved();
    return super.gruposAtendimento;
  }

  @override
  set gruposAtendimento(ObservableList<GrupoAtendimentoModel> value) {
    _$gruposAtendimentoAtom.context.conditionallyRunInAction(() {
      super.gruposAtendimento = value;
      _$gruposAtendimentoAtom.reportChanged();
    }, _$gruposAtendimentoAtom, name: '${_$gruposAtendimentoAtom.name}_set');
  }

  final _$grupoModelAtom = Atom(name: '_GrupoControllerBase.grupoModel');

  @override
  GrupoAtendimentoModel get grupoModel {
    _$grupoModelAtom.context.enforceReadPolicy(_$grupoModelAtom);
    _$grupoModelAtom.reportObserved();
    return super.grupoModel;
  }

  @override
  set grupoModel(GrupoAtendimentoModel value) {
    _$grupoModelAtom.context.conditionallyRunInAction(() {
      super.grupoModel = value;
      _$grupoModelAtom.reportChanged();
    }, _$grupoModelAtom, name: '${_$grupoModelAtom.name}_set');
  }

  final _$_GrupoControllerBaseActionController =
      ActionController(name: '_GrupoControllerBase');

  @override
  void listarGrupoAtendimentos() {
    final _$actionInfo = _$_GrupoControllerBaseActionController.startAction();
    try {
      return super.listarGrupoAtendimentos();
    } finally {
      _$_GrupoControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
