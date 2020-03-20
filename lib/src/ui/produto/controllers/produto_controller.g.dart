// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProdutoController on _ProdutoControllerBase, Store {
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

  final _$recadosAtom = Atom(name: '_ProdutoControllerBase.recados');

  @override
  ObservableList<RecadoModel> get recados {
    _$recadosAtom.context.enforceReadPolicy(_$recadosAtom);
    _$recadosAtom.reportObserved();
    return super.recados;
  }

  @override
  set recados(ObservableList<RecadoModel> value) {
    _$recadosAtom.context.conditionallyRunInAction(() {
      super.recados = value;
      _$recadosAtom.reportChanged();
    }, _$recadosAtom, name: '${_$recadosAtom.name}_set');
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

  final _$_ProdutoControllerBaseActionController =
      ActionController(name: '_ProdutoControllerBase');

  @override
  void listarProdutosByGrupoAtendimento(GrupoModel grupo) {
    final _$actionInfo = _$_ProdutoControllerBaseActionController.startAction();
    try {
      return super.listarProdutosByGrupoAtendimento(grupo);
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

  @override
  void carregarProduto(ProdutoModel produtoSelecionado, BuildContext context) {
    final _$actionInfo = _$_ProdutoControllerBaseActionController.startAction();
    try {
      return super.carregarProduto(produtoSelecionado, context);
    } finally {
      _$_ProdutoControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
