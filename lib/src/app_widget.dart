import 'package:MetreX/src/caixa/caixa_page.dart';
import 'package:MetreX/src/configuracao/configuracao_page.dart';
import 'package:MetreX/src/mesa/controllers/mesa_controller.dart';
import 'package:MetreX/src/mesa/mesa_page.dart';
import 'package:MetreX/src/pedido/controllers/pedido_controller.dart';
import 'package:MetreX/src/pedido/pedido_page.dart';
import 'package:MetreX/src/recebimento/recebimento_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'home/home_page.dart';
import 'login/blocs/usuario_bloc.dart';
import 'login/login_page.dart';
import 'mesa/widgets/detalhar_mesa_page.dart';
import 'produto/controllers/produto_controller.dart';

class MainAPP extends StatefulWidget {
  @override
  _MainAPPState createState() => _MainAPPState();
}

class _MainAPPState extends State<MainAPP> {
  @override
  void initState() {
    super.initState();
    GetIt getIt = GetIt.instance;
    getIt.registerSingleton<MesaController>(MesaController());
    getIt.registerSingleton<PedidoController>(PedidoController());
    getIt.registerSingleton<ProdutoController>(ProdutoController());
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: getProviders(),
      child: MaterialApp(
        title: "Otica App",
        debugShowCheckedModeBanner: false,
        initialRoute: "login",
        routes: getRoutes(),
        theme: getTheme(),
        // supportedLocales: [const Locale('pt', 'BR')],
      ),
    );
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {
      "login": (context) => LoginPage(),
      "home": (context) => HomePage(),
      "mesa": (context) => MesaPage(),
      "detalharMesa": (context) => DetalharMesaPage(),
      "pedido": (context) => PedidoPage(),
      "produto": (context) => ProdutoPage(),
      "caixa": (context) => CaixaPage(),
      "recebimento": (context) => RecebimentoPage(),
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

  List<SingleChildCloneableWidget> getProviders() {
    return [
      ChangeNotifierProvider<UsuarioBloc>.value(
        value: UsuarioBloc(),
      ),
    ];
  }
}
