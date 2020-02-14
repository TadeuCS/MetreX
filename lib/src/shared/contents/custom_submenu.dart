import 'package:flutter/material.dart';

class CustomSubMenu extends StatelessWidget {
  final String descricao;
  final TextAlign align;
  Widget sufixWidget;

  CustomSubMenu(
      {@required this.descricao,
      this.align = TextAlign.center,
      this.sufixWidget}) {
    if (this.sufixWidget == null) {
      this.sufixWidget = Container();
    }
  }

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
            sufixWidget,
          ],
        ),
        Divider(),
      ],
    );
  }
}
