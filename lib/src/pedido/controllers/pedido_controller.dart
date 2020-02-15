import 'package:MetreX/src/pedido/models/pedido_model.dart';
import 'package:MetreX/src/pedido/services/pedido_service.dart';
import 'package:mobx/mobx.dart';

part 'pedido_controller.g.dart';

class PedidoController = _PedidoControllerBase with _$PedidoController;

abstract class _PedidoControllerBase with Store {
  PedidoService pedidoService = PedidoService();

  @observable
  var pedido = PedidoModel();

  @action
  void carregaPedido(int idPedido) {
    pedidoService
        .getPedido(idPedido)
        .then((pedidoCarregado) => pedido = pedidoCarregado);
  }
}
