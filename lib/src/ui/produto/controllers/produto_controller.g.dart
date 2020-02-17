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

  final _$produtosListadosAtom =
      Atom(name: '_ProdutoControllerBase.produtosListados');

  @override
  ObservableList<ProdutoModel> get produtosListados {
    _$produtosListadosAtom.context.enforceReadPolicy(_$produtosListadosAtom);
    _$produtosListadosAtom.reportObserved();
    return super.produtosListados;
  }

  @override
  set produtosListados(ObservableList<ProdutoModel> value) {
    _$produtosListadosAtom.context.conditionallyRunInAction(() {
      super.produtosListados = value;
      _$produtosListadosAtom.reportChanged();
    }, _$produtosListadosAtom, name: '${_$produtosListadosAtom.name}_set');
  }

  final _$produtosFiltradosAtom =
      Atom(name: '_ProdutoControllerBase.produtosFiltrados');

  @override
  ObservableList<ProdutoModel> get produtosFiltrados {
    _$produtosFiltradosAtom.context.enforceReadPolicy(_$produtosFiltradosAtom);
    _$produtosFiltradosAtom.reportObserved();
    return super.produtosFiltrados;
  }

  @override
  set produtosFiltrados(ObservableList<ProdutoModel> value) {
    _$produtosFiltradosAtom.context.conditionallyRunInAction(() {
      super.produtosFiltrados = value;
      _$produtosFiltradosAtom.reportChanged();
    }, _$produtosFiltradosAtom, name: '${_$produtosFiltradosAtom.name}_set');
  }

  final _$produtoModelAtom = Atom(name: '_ProdutoControllerBase.produtoModel');

  @override
  ProdutoModel get produtoModel {
    _$produtoModelAtom.context.enforceReadPolicy(_$produtoModelAtom);
    _$produtoModelAtom.reportObserved();
    return super.produtoModel;
  }

  @override
  set produtoModel(ProdutoModel value) {
    _$produtoModelAtom.context.conditionallyRunInAction(() {
      super.produtoModel = value;
      _$produtoModelAtom.reportChanged();
    }, _$produtoModelAtom, name: '${_$produtoModelAtom.name}_set');
  }

  final _$grupoModelAtom = Atom(name: '_ProdutoControllerBase.grupoModel');

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
  void listarProdutosByGrupoAtendimento() {
    final _$actionInfo = _$_ProdutoControllerBaseActionController.startAction();
    try {
      return super.listarProdutosByGrupoAtendimento();
    } finally {
      _$_ProdutoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filtraProdutosListados(String filtro) {
    final _$actionInfo = _$_ProdutoControllerBaseActionController.startAction();
    try {
      return super.filtraProdutosListados(filtro);
    } finally {
      _$_ProdutoControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
