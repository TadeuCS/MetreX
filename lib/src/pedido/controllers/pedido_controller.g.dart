// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pedido_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PedidoController on _PedidoControllerBase, Store {
  final _$pedidoAtom = Atom(name: '_PedidoControllerBase.pedido');

  @override
  PedidoModel get pedido {
    _$pedidoAtom.context.enforceReadPolicy(_$pedidoAtom);
    _$pedidoAtom.reportObserved();
    return super.pedido;
  }

  @override
  set pedido(PedidoModel value) {
    _$pedidoAtom.context.conditionallyRunInAction(() {
      super.pedido = value;
      _$pedidoAtom.reportChanged();
    }, _$pedidoAtom, name: '${_$pedidoAtom.name}_set');
  }

  final _$_PedidoControllerBaseActionController =
      ActionController(name: '_PedidoControllerBase');

  @override
  void carregaPedido(int idPedido) {
    final _$actionInfo = _$_PedidoControllerBaseActionController.startAction();
    try {
      return super.carregaPedido(idPedido);
    } finally {
      _$_PedidoControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
