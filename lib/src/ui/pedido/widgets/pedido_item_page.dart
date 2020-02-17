import 'package:flutter/material.dart';

class PedidoItemPage extends StatefulWidget {
  @override
  _PedidoItemPageState createState() => _PedidoItemPageState();
}

class _PedidoItemPageState extends State<PedidoItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item'),
        centerTitle: true,
      ),
    );
  }
}
