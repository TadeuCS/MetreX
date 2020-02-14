import 'package:MetreX/src/caixa/caixa_page.dart';
import 'package:MetreX/src/configuracao/configuracao_page.dart';
import 'package:MetreX/src/mesa/controllers/mesa_controller.dart';
import 'package:MetreX/src/mesa/mesa_page.dart';
import 'package:MetreX/src/mesa/widgets/nova_mesa_page.dart';
import 'package:MetreX/src/pedido/pedido_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'home/home_page.dart';
import 'login/blocs/usuario_bloc.dart';
import 'login/login_page.dart';

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
      "novaMesa": (context) => NovaMesaPage(),
      "pedido": (context) => PedidoPage(),
      "caixa": (context) => CaixaPage(),
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
