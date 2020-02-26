import 'package:MetreX/src/shared/util/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<bool> showConfirmDialog(
    BuildContext context, String title, String msg) async {
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
  AlertDialog alert = AlertDialog(
    title: Text("$title"),
    content: Text("$msg"),
    actions: [
      cancelaButton,
      continuaButton,
    ],
  );
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Future<bool> showInputNumberDialog(
    BuildContext context, String title, String msg) async {
  AlertDialog alert = AlertDialog(
    title: Text("$title"),
    content: TextField(
      autofocus: true,
      textAlign: TextAlign.end,
      controller: Constants.moneyMask,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: msg, hintText: 'Ex: 10,55'),
    ),
    actions: [
      _cancelButton(context),
      _confirmButton(context),
    ],
  );
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Future<bool> showSuccessAlert(BuildContext context, String msg) async {
  AlertDialog alert = AlertDialog(
    title: Text(""),
    content: Container(
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.network(
            'https://media.tenor.com/images/771577ac99bc46709e85e2f8ad5376ea/tenor.gif',
            height: 60,
          ),
          Text(msg)
        ],
      ),
    ),
    actions: [
      _OkButton(context),
    ],

  );
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Future<bool> showWarningAlert(BuildContext context, String msg) async {
  AlertDialog alert = AlertDialog(
    title: Text(""),
    content: Container(
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.network(
            'https://i.makeagif.com/media/4-15-2015/Hd69pZ.gif',
            height: 60,
          ),
          Text(msg)
        ],
      ),
    ),
    actions: [
      _OkButton(context),
    ],

  );
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Future<bool> showInputTextDialog(
    BuildContext context, String title, String msg) async {
  AlertDialog alert = AlertDialog(
    title: Text("$title"),
    content: Container(
      height: 100,
      child: TextField(
        autofocus: true,
        textAlign: TextAlign.start,
        keyboardType: TextInputType.text,
        maxLines: 3,
        decoration: InputDecoration(
            labelText: msg, hintText: 'Ex: Desistencia do Cliente'),
      ),
    ),
    actions: [
      _cancelButton(context),
      _confirmButton(context),
    ],
  );
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

_OkButton(BuildContext context) {
  return FlatButton(
    child: Text("Ok"),
    onPressed: () {
      Navigator.of(context).pop(true);
    },
  );
}

_confirmButton(BuildContext context) {
  return FlatButton(
    child: Text("Continuar"),
    onPressed: () {
      Navigator.of(context).pop(true);
    },
  );
}

_cancelButton(BuildContext context) {
  return FlatButton(
    child: Text("Cancelar"),
    onPressed: () {
      Navigator.of(context).pop(false);
    },
  );
}
