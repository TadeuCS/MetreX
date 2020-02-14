import 'package:MetreX/src/shared/util/Constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'blocs/usuario_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  UsuarioBloc usuarioBloc;
  final _form = GlobalKey<FormState>();
  final _scaffouldKey = GlobalKey<ScaffoldState>();
  final _usuarioController = TextEditingController(
      // text: "tadeu",
      );
  final _senhaController = TextEditingController(
      // text: "123",
      );
  @override
  void initState() {
    super.initState();
    usuarioBloc = Provider.of<UsuarioBloc>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    _initVariables(context);
    return Form(
      key: _form,
      child: SafeArea(
        child: Scaffold(
          key: _scaffouldKey,
          body: ListView(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            children: <Widget>[
              _logo(context),
              _email(context),
              _senha(context),
              _entrar(context),
            ],
          ),
        ),
      ),
    );
  }

  MaterialButton _entrar(BuildContext context) {
    return MaterialButton(
      color: Theme.of(context).primaryColor,
      height: 50,
      textColor: Colors.white,
      onPressed: () => _login(context),
      child: Text(
        "Entrar",
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  Widget _senha(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: _senhaController,
        obscureText: true,
        onEditingComplete: () => _login(context),
        decoration: InputDecoration(
            hintText: 'Senha',
            prefixIcon: Icon(Icons.lock),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor))),
        validator: (text) {
          return text.trim().isEmpty ? 'Informe a senha' : null;
        },
      ),
    );
  }

  Padding _email(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: TextFormField(
        controller: _usuarioController,
        decoration: InputDecoration(
            hintText: 'Usuário',
            prefixIcon: Icon(Icons.person),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor))),
        validator: (text) {
          return text.trim().isEmpty ? 'Informe o Usuário' : null;
        },
      ),
    );
  }

  Widget _logo(BuildContext context) {
    return InkWell(
      onLongPress: () {
        // Navigator.pushReplacementNamed(context, 'configuracao');
      },
      child: Container(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            FlutterLogo(size: 120,),
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Metre X ',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  Icon(
                    Icons.copyright,
                    color: Colors.grey,
                    size: 12,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _initVariables(BuildContext context) async {
    if (Constants.prefs == null) {
      Constants.prefs = await SharedPreferences.getInstance();
    }
  }

  _login(BuildContext context) {
    // if (_form.currentState.validate()) {
    //   usuarioBloc.login(context, _scaffouldKey, _usuarioController.text.trim(),
    //       _senhaController.text);
    // }
    Navigator.pushReplacementNamed(context, 'home');
  }
}
