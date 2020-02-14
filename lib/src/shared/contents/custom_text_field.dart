import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController nomeController;
  final bool readOnly;
  final TextAlign textAlign;
  final TextInputType inputType;
  final double width;
  final bool textArea;
  final bool hasBorder;
  final String label;
  final VoidCallback onConfirm;
  final bool obscure;
  final Function validation;

  CustomTextField(
      {@required this.nomeController,
      this.hintText,
      this.readOnly,
      this.textAlign,
      this.inputType,
      this.width,
      this.textArea,
      this.hasBorder,
      this.label,
      this.onConfirm,
      this.obscure = false,
      this.validation});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.maxFinite,
      child: TextFormField(
        textAlign: widget.textAlign ?? TextAlign.left,
        readOnly: widget.readOnly ?? false,
        keyboardType: widget.inputType ?? TextInputType.text,
        controller: widget.nomeController,
        onEditingComplete: widget.onConfirm,
        maxLines: widget.textArea == null || !widget.textArea ? 1 : 2,
        obscureText: widget.obscure,
        validator: (text) {
          bool isValid = widget.validation(text);
          return isValid ? null : widget.hintText;
        },
        decoration: InputDecoration(
          labelText: widget.label,
          hintText: widget.hintText,
          border: widget.hasBorder == null || !widget.hasBorder
              ? UnderlineInputBorder()
              : OutlineInputBorder(),
        ),
      ),
    );
  }
}
