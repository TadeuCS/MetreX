// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caixa_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CaixaController on _CaixaControllerBase, Store {
  final _$caixaModelAtom = Atom(name: '_CaixaControllerBase.caixaModel');

  @override
  CaixaModel get caixaModel {
    _$caixaModelAtom.context.enforceReadPolicy(_$caixaModelAtom);
    _$caixaModelAtom.reportObserved();
    return super.caixaModel;
  }

  @override
  set caixaModel(CaixaModel value) {
    _$caixaModelAtom.context.conditionallyRunInAction(() {
      super.caixaModel = value;
      _$caixaModelAtom.reportChanged();
    }, _$caixaModelAtom, name: '${_$caixaModelAtom.name}_set');
  }

  final _$_CaixaControllerBaseActionController =
      ActionController(name: '_CaixaControllerBase');

  @override
  void carregarCaixa(CaixaModel caixaModel) {
    final _$actionInfo = _$_CaixaControllerBaseActionController.startAction();
    try {
      return super.carregarCaixa(caixaModel);
    } finally {
      _$_CaixaControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
