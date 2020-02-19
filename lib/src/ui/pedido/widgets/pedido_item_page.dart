import 'package:MetreX/src/shared/util/Session.dart';
import 'package:flutter/material.dart';

class PedidoItemPage extends StatefulWidget {
  @override
  _PedidoItemPageState createState() => _PedidoItemPageState();
}

class _PedidoItemPageState extends State<PedidoItemPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Detalhes do Item'),
          centerTitle: true,
        ),
        body: buildContent(),
      ),
    );
  }

  buildContent() {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: <Widget>[
        ListTile(
          title: Text(
            Session.produtoController.produtoModel.descricao,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          subtitle: Text('R\$ ${Session.produtoController.produtoModel.preco.toStringAsFixed(2)}', style: TextStyle(fontWeight: FontWeight.w500),),
        ),
        TextFormField(
          
          decoration: InputDecoration(
          ),
        )
      ],
    );
  }
}
