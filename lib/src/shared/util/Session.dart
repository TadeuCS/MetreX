import 'package:MetreX/src/ui/grupo/controllers/grupo_controller.dart';
import 'package:MetreX/src/ui/login/controllers/usuario_controller.dart';
import 'package:MetreX/src/ui/mesa/controllers/mesa_controller.dart';
import 'package:MetreX/src/ui/pedido/controllers/pedido_controller.dart';
import 'package:MetreX/src/ui/produto/controllers/produto_controller.dart';
import 'package:get_it/get_it.dart';

class Session {
  static var usuarioController = GetIt.I.get<UsuarioController>();
  static var mesaController = GetIt.I.get<MesaController>();
  static var pedidoController = GetIt.I.get<PedidoController>();
  static var produtoController = GetIt.I.get<ProdutoController>();
  static var grupoController = GetIt.I.get<GrupoController>();
}
