import 'package:MetreX/src/mesa/controllers/mesa_controller.dart';
import 'package:MetreX/src/produto/controllers/produto_controller.dart';
import 'package:MetreX/src/shared/util/Constants.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'controllers/pedido_controller.dart';

class PedidoPage extends StatelessWidget {
  MesaController mesaController = GetIt.I.get<MesaController>();
  PedidoController pedidoController = GetIt.I.get<PedidoController>();
  ProdutoController produtoController = GetIt.I.get<ProdutoController>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Mesa ${mesaController.mesaModel.numeroMesa}"),
          bottom: _tabBar(context),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.pushNamed(context, 'produtos');
              },
            ),
          ],
        ),
        body: _content(context),
      ),
    );
  }

  TabBarView _content(BuildContext context) {
    return TabBarView(
      children: <Widget>[
        Container(
          child: _gridGrupoAtendimento(),
        ),
        Container(
          child: Text("2"),
        ),
        Container(
          child: Text("3"),
        ),
      ],
    );
  }

  Widget _tabBar(BuildContext context) {
    return TabBar(
      indicatorColor: Theme.of(context).backgroundColor,
      tabs: <Widget>[
        Tab(
          icon: Icon(Icons.add_shopping_cart),
        ),
        Tab(
          icon: Icon(Icons.print),
        ),
        Tab(
          icon: Icon(Icons.shopping_cart),
        ),
      ],
    );
  }

  Widget _gridGrupoAtendimento() {
    return GridView.builder(
      itemCount: produtoController.gruposAtendimento.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 1.6),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, 'produtos');
          },
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                produtoController.gruposAtendimento[index].imagem.isEmpty
                    ? Icon(Icons.image)
                    : Image.network(
                        "${Constants.servidor}/resources/64px/${produtoController.gruposAtendimento[index].imagem}.png",
                        width: 30,
                      ),
                Text(
                  produtoController.gruposAtendimento[index].descricao,
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
