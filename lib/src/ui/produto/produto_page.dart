import 'package:MetreX/src/shared/util/OUtil.dart';
import 'package:MetreX/src/shared/util/Session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProdutoPage extends StatefulWidget {
  @override
  _ProdutoPageState createState() => _ProdutoPageState();
}

class _ProdutoPageState extends State<ProdutoPage> {
  @override
  void initState() {
    super.initState();
    Session.produtoController
        .listarProdutosByGrupoAtendimento(Session.produtoController.grupoModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildContent(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
        title: TextField(
      style: TextStyle(
        color: Colors.white,
      ),
      textAlign: TextAlign.left,
      textAlignVertical: TextAlignVertical.center,
      autofocus: true,
      onChanged: Session.produtoController.filtraProdutosListados,
      decoration: InputDecoration(
          alignLabelWithHint: true,
          hintStyle: TextStyle(color: Colors.white, fontSize: 12),
          hintText: "Digite o código ou a descrição"),
    ));
  }

  buildContent() {
    return Observer(builder: (_) {
      return ListView(
        children: Session.produtoController.produtosFiltrados
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
                    onTap: () =>
                        Session.produtoController.carregarProduto(p, context),
                    subtitle: Text(OUtil.formataMoeda(p.preco)),
                  ),
                ))
            .toList(),
      );
    });
  }
}
