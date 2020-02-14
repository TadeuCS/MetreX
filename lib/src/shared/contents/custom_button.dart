import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  final String text;
  final VoidCallback acao;

  CustomButtom({@required this.text, @required this.acao});

  @override
  Widget build(BuildContext context) {
    print(acao==null);
    return MaterialButton(
      color: Theme.of(context).primaryColor,
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        acao();
      },
    );
  }
}
