// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProdutoController on _ProdutoControllerBase, Store {
  final _$gruposAtendimentoAtom =
      Atom(name: '_ProdutoControllerBase.gruposAtendimento');

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

  final _$produtosAtom = Atom(name: '_ProdutoControllerBase.produtos');

  @override
  ObservableList<ProdutoModel> get produtos {
    _$produtosAtom.context.enforceReadPolicy(_$produtosAtom);
    _$produtosAtom.reportObserved();
    return super.produtos;
  }

  @override
  set produtos(ObservableList<ProdutoModel> value) {
    _$produtosAtom.context.conditionallyRunInAction(() {
      super.produtos = value;
      _$produtosAtom.reportChanged();
    }, _$produtosAtom, name: '${_$produtosAtom.name}_set');
  }

  final _$_ProdutoControllerBaseActionController =
      ActionController(name: '_ProdutoControllerBase');

  @override
  void listarGrupoAtendimentos() {
    final _$actionInfo = _$_ProdutoControllerBaseActionController.startAction();
    try {
      return super.listarGrupoAtendimentos();
    } finally {
      _$_ProdutoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void listarProdutosByGrupoAtendimento(int idGrupo) {
    final _$actionInfo = _$_ProdutoControllerBaseActionController.startAction();
    try {
      return super.listarProdutosByGrupoAtendimento(idGrupo);
    } finally {
      _$_ProdutoControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
