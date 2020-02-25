import 'package:flutter/material.dart';

class CustomOutputLabel extends StatelessWidget {
  
  final String label;
  final String text;
  final bool softWrap;

  CustomOutputLabel(this.label,this.text, {this.softWrap});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(label, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),),
        Expanded(child: Text(text, style: TextStyle(fontSize: 15), softWrap: softWrap,))
      ],
    );
  }
}