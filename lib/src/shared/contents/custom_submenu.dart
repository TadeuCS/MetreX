import 'package:flutter/material.dart';

class CustomSubMenu extends StatelessWidget {
  final String descricao;
  final TextAlign align;
  final Widget sufixWidget;

  CustomSubMenu(
  this.descricao, {
      this.align = TextAlign.center,
      this.sufixWidget});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              descricao,
              textAlign: align,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.grey),
            ),
            sufixWidget??Container(),
          ],
        ),
        Divider(),
      ],
    );
  }
}
