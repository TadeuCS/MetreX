// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mesa_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MesaController on _MesaControllerBase, Store {
  final _$mesaModelAtom = Atom(name: '_MesaControllerBase.mesaModel');

  @override
  MesaModel get mesaModel {
    _$mesaModelAtom.context.enforceReadPolicy(_$mesaModelAtom);
    _$mesaModelAtom.reportObserved();
    return super.mesaModel;
  }

  @override
  set mesaModel(MesaModel value) {
    _$mesaModelAtom.context.conditionallyRunInAction(() {
      super.mesaModel = value;
      _$mesaModelAtom.reportChanged();
    }, _$mesaModelAtom, name: '${_$mesaModelAtom.name}_set');
  }

  final _$mesasFiltradasAtom = Atom(name: '_MesaControllerBase.mesasFiltradas');

  @override
  ObservableList<MesaModel> get mesasFiltradas {
    _$mesasFiltradasAtom.context.enforceReadPolicy(_$mesasFiltradasAtom);
    _$mesasFiltradasAtom.reportObserved();
    return super.mesasFiltradas;
  }

  @override
  set mesasFiltradas(ObservableList<MesaModel> value) {
    _$mesasFiltradasAtom.context.conditionallyRunInAction(() {
      super.mesasFiltradas = value;
      _$mesasFiltradasAtom.reportChanged();
    }, _$mesasFiltradasAtom, name: '${_$mesasFiltradasAtom.name}_set');
  }

  final _$_MesaControllerBaseActionController =
      ActionController(name: '_MesaControllerBase');

  @override
  void abrirMesa(String numeroMesa, BuildContext context) {
    final _$actionInfo = _$_MesaControllerBaseActionController.startAction();
    try {
      return super.abrirMesa(numeroMesa, context);
    } finally {
      _$_MesaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void listarTodas() {
    final _$actionInfo = _$_MesaControllerBaseActionController.startAction();
    try {
      return super.listarTodas();
    } finally {
      _$_MesaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filtrar(String text) {
    final _$actionInfo = _$_MesaControllerBaseActionController.startAction();
    try {
      return super.filtrar(text);
    } finally {
      _$_MesaControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
