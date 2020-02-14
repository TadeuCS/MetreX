import 'package:flutter/material.dart';

class CustomRadio extends StatefulWidget {
  
  final TextEditingController lenteController;

  CustomRadio(this.lenteController);

  @override
  _CustomRadioState createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  String _radioValue;
  String choice;

  @override
  void initState() {
    super.initState();
    radioButtonChanges(widget.lenteController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          _radioButton('V. Simples'),
          _radioButton('Bifocais'),
          _radioButton('Multifocais'),
        ],
      ),
    );
  }

  void radioButtonChanges(String value) {
    setState(() {
      print('Option: ' + value);
      _radioValue = value;
      switch (value) {
        case 'Bifocais':
          choice = value;
          break;
        case 'Multifocais':
          choice = value;
          break;
        default:
          choice = value;
      }
      widget.lenteController.text=value;
    });
  }

  Row _radioButton(String label) {
    return Row(
      children: <Widget>[
        Radio(
          value: label,
          groupValue: _radioValue,
          onChanged: radioButtonChanges,
        ),
        Text(
          label,
        ),
      ],
    );
  }
}
