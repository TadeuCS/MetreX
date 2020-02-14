import 'package:flutter/material.dart';

Future<bool> showConfirmDialog(BuildContext context, String title, String msg) async {
  Widget cancelaButton = FlatButton(
    child: Text("Cancelar"),
    onPressed: () {
      Navigator.of(context).pop(false);
    },
  );
  Widget continuaButton = FlatButton(
    child: Text("Continuar"),
    onPressed: () {
       Navigator.of(context).pop(true);
    },
  );
  //configura o AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("$title"),
    content: Text("$msg"),
    actions: [
      cancelaButton,
      continuaButton,
    ],
  );
  //exibe o diálogo
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
