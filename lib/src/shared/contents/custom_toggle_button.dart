import 'package:flutter/material.dart';

class CustomToggleButton extends StatefulWidget {
  final Color selectedColor;
  final Color unselectedColor;
  final Function rightAction;
  final Function leftAction;
  final String rightLabel;
  final String leftLabel;

  CustomToggleButton({
    this.selectedColor = Colors.lightBlue,
    this.unselectedColor = Colors.white,
    @required this.leftAction,
    @required this.rightAction,
    @required this.leftLabel,
    @required this.rightLabel
  });

  @override
  _CustomToggleButtonState createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  bool leftSelected = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: RaisedButton(
            textColor: leftSelected ? widget.unselectedColor : Colors.black54,
            color: leftSelected ? widget.selectedColor : widget.unselectedColor,
            child: Text(widget.leftLabel),
            onPressed: () {
              setState(() {
                leftSelected = true;
              });
              widget.leftAction();  
              // print(leftSelected);
            },
          ),
        ),
        Expanded(
          child: RaisedButton(
            textColor: !leftSelected ? widget.unselectedColor : Colors.black54,
            color:
                !leftSelected ? widget.selectedColor : widget.unselectedColor,
            child: Text(widget.rightLabel),
            onPressed: () {
              setState(() {
                leftSelected = false;
              });
              widget.rightAction();
              // print(leftSelected);
            },
          ),
        ),
      ],
    );
  }
}
