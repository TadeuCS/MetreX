import 'package:MetreX/src/ui/caixa/controllers/caixa_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'ui/caixa/caixa_page.dart';
import 'ui/caixa/widgets/conferencia_caixa_page.dart';
import 'ui/configuracao/configuracao_page.dart';
import 'ui/home/home_page.dart';
import 'ui/login/controllers/usuario_controller.dart';
import 'ui/login/login_page.dart';
import 'ui/mesa/controllers/mesa_controller.dart';
import 'ui/mesa/mesa_page.dart';
import 'ui/mesa/widgets/detalhar_mesa_page.dart';
import 'ui/pedido/controllers/pedido_controller.dart';
import 'ui/pedido/pedido_page.dart';
import 'ui/pedido/widgets/pedido_item_page.dart';
import 'ui/produto/controllers/produto_controller.dart';
import 'ui/produto/produto_page.dart';
import 'ui/produto/widgets/grupo_atendimento_page.dart';
import 'ui/recebimento/recebimento_page.dart';
import 'ui/recebimento/widget/forma_recebimento_page.dart';

class MainAPP extends StatefulWidget {
  @override
  _MainAPPState createState() => _MainAPPState();
}

class _MainAPPState extends State<MainAPP> {
  @override
  void initState() {
    super.initState();
    GetIt getIt = GetIt.instance;
    getIt.registerSingleton<UsuarioController>(UsuarioController());
    getIt.registerSingleton<MesaController>(MesaController());
    getIt.registerSingleton<PedidoController>(PedidoController());
    getIt.registerSingleton<ProdutoController>(ProdutoController());
    getIt.registerSingleton<CaixaController>(CaixaController());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Metre POS",
      debugShowCheckedModeBanner: false,
      initialRoute: "login",
      routes: getRoutes(),
      theme: getTheme(),
      // supportedLocales: [const Locale('pt', 'BR')],
    );
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {
      "login": (context) => LoginPage(),
      "home": (context) => HomePage(),
      "mesa": (context) => MesaPage(),
      "detalharMesa": (context) => DetalharMesaPage(),
      "pedido": (context) => PedidoPage(),
      "item": (context) => PedidoItemPage(),
      "produto": (context) => ProdutoPage(),
      "grupo": (context) => GrupoAtendimentoPage(),
      "caixa": (context) => CaixaPage(),
      "conferencia": (context) => ConferenciaCaixaPage(),
      "recebimento": (context) => RecebimentoPage(),
      "forma": (context) => FormaRecebimentoPage(),
      "configuracao": (context) => ConfigurcaoPage(),
    };
  }

  ThemeData getTheme() {
    return ThemeData(
        primaryColorLight: Colors.indigo,
        buttonColor: Colors.lightBlue[700],
        hintColor: Colors.grey[400],
        backgroundColor: Colors.white70,
        indicatorColor: Colors.white,
        focusColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.white));
  }

  // List<SingleChildCloneableWidget> getProviders() {
  //   return [
  //     ChangeNotifierProvider<UsuarioBloc>.value(
  //       value: UsuarioBloc(),
  //     ),
  //   ];
  // }
}
