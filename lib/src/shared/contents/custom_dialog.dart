import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

final lowPrice =
    MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: '.');

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
      controller: lowPrice,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: msg,
        hintText: 'Ex: 10,55'
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
          labelText: msg,
          hintText: 'Ex: Desistencia do Cliente'
        ),
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
