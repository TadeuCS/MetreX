import 'package:MetreX/src/ui/pedido/models/pedido_model.dart';
import 'package:MetreX/src/ui/pedido/services/pedido_service.dart';
import 'package:mobx/mobx.dart';

part 'pedido_controller.g.dart';

class PedidoController = _PedidoControllerBase with _$PedidoController;

abstract class _PedidoControllerBase with Store {
  PedidoService pedidoService = PedidoService('pedido/');

  @observable
  var pedido = PedidoModel(itens: List());

  @action
  void carregaPedido(int idPedido) {
    pedidoService.getPedido(idPedido).then((pedidoCarregado) {
      if (pedidoCarregado != null) {
        pedido = pedidoCarregado;
      } else {
        pedido = PedidoModel();
      }
    });
  }
}
