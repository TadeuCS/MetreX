import 'package:MetreX/src/shared/util/Constants.dart';
import 'package:MetreX/src/shared/util/Session.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _form = GlobalKey<FormState>();
  final _scaffouldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    Session();
    SharedPreferences.getInstance().then((variaveis) {
      Constants.prefs = variaveis;
      // if (Constants.prefs.getString('url') == null) {
        Constants.prefs.setString('url', Constants.apiUrl);
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
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

  Widget _logo(BuildContext context) {
    return InkWell(
      onLongPress: () {
        // Navigator.pushReplacementNamed(context, 'configuracao');
      },
      child: Container(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            FlutterLogo(
              size: 120,
            ),
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

  Padding _email(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: TextFormField(
        onChanged: (text) {
          Session.usuarioController.usuarioModel.usuario = text.trim();
        },
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

  Widget _senha(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        obscureText: true,
        onChanged: (text) {
          Session.usuarioController.usuarioModel.senha = text.trim();
        },
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

  _login(BuildContext context) {
    // if (_form.currentState.validate()) {
      // usuarioController.login(context, _scaffouldKey);
    // }
    Navigator.pushNamed(context, 'home');
  }
}
