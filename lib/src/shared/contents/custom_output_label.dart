import 'package:flutter/material.dart';

class CustomOutputLabel extends StatelessWidget {
  
  final String label;
  final String text;

  CustomOutputLabel(this.label,this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(label, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),),
        Text(text)
      ],
    );
  }
}