
import 'package:MetreX/src/ui/mesa/controllers/mesa_controller.dart';
import 'package:MetreX/src/ui/pedido/controllers/pedido_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'controllers/produto_controller.dart';

class ProdutoPage extends StatefulWidget {
  @override
  _ProdutoPageState createState() => _ProdutoPageState();
}

class _ProdutoPageState extends State<ProdutoPage> {
  MesaController mesaController = GetIt.I.get<MesaController>();
  PedidoController pedidoController = GetIt.I.get<PedidoController>();
  ProdutoController produtoController = GetIt.I.get<ProdutoController>();

  @override
  void initState() {
    super.initState();
    produtoController.listarProdutosByGrupoAtendimento();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          style: TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.left,
          textAlignVertical: TextAlignVertical.center,
          autofocus: true,
          onChanged: (text) {
            produtoController.filtraProdutosListados(text);
          },
          decoration: InputDecoration(
              alignLabelWithHint: true,
              hintStyle: TextStyle(color: Colors.white, fontSize: 12),
              hintText: "Digite o código ou a descrição"),
        ),
      ),
      body: _content(),
    );
  }

  Widget _content() {
    return Container(
      child: Observer(builder: (_) {
        return ListView(
          children: produtoController.produtosFiltrados
              .map((p) => Card(
                    child: ListTile(
                      leading: Icon(Icons.info),
                      title: Row(
                        children: <Widget>[
                          Expanded(child: Text(p.descricao)),
                          Text(
                            p.idProduto.toString(),
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, "item");
                      },
                      subtitle: Text(p.preco.toStringAsFixed(2)),
                    ),
                  ))
              .toList(),
        );
      }),
    );
  }

}
