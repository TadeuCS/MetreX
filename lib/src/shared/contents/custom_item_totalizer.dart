import 'package:flutter/material.dart';

class CustomItemTotalizer extends StatelessWidget {
  final String label;
  final String value;
  final bool isTotalizer;

  final TextStyle styleLabel = TextStyle(fontWeight: FontWeight.w500, fontSize: 18);
  final TextStyle styleValue = TextStyle(fontSize: 16);

  CustomItemTotalizer(
      {@required this.label, @required this.value, this.isTotalizer = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          label,
          textAlign: TextAlign.start,
          style: styleLabel,
        ),
        Text(
          value,
          style: isTotalizer
              ? styleLabel
              : styleValue,
        )
      ],
    );
  }
}
