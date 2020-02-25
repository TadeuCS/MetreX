import 'package:MetreX/src/shared/util/Session.dart';
import 'package:MetreX/src/ui/pedido/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'models/mesa_model.dart';

class MesaPage extends StatefulWidget {
  @override
  _MesaPageState createState() => _MesaPageState();
}

class _MesaPageState extends State<MesaPage> {
  static final String title = 'Metre X';
  Icon _searchIcon = Icon(Icons.search);
  Widget appBarTitle = Text(title);
  TextEditingController _filter = TextEditingController();

  @override
  void initState() {
    super.initState();
    Session.mesaController.listarTodas();
//    searchPressed();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Observer(builder: (_) {
        return Scaffold(
          appBar: AppBar(
              centerTitle: true,
              title: appBarTitle,
              leading: IconButton(
                icon: _searchIcon,
                onPressed: searchPressed,
              )),
          // drawer: CustomDrawer(),
          body: content(),
        );
      }),
    );
  }

  content() {
    return Session.mesaController.mesasFiltradas.isEmpty
        ? Center(
            child: Container(
            width: 150,
            height: 150,
            child: gridItem(MesaModel(numeroMesa: _filter.text)),
          ))
        : GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            children:
                Session.mesaController.mesasFiltradas.map((e) => gridItem(e)).toList(),
          );
  }

  Widget gridItem(MesaModel mesaModel) {
    bool novaMesa = (mesaModel.idMesa == null);
    return InkWell(
      child: Card(
        color: novaMesa ? Colors.grey : Colors.green[300],
        child: Stack(
          children: <Widget>[
            novaMesa
                ? Positioned(
                    right: 0,
                    child: Icon(
                      Icons.add,
                      size: 50,
                    ))
                : Container(),
            Center(
              child: Text(
                mesaModel.numeroMesa,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
                bottom: 2,
                right: 2,
                child: Text(
                  'R\$ ${mesaModel.valorTotal.toStringAsFixed(2)}',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
      onTap: () {
        Session.mesaController.mesaModel = mesaModel;
        try {
          // mesaController.abrirMesa();
          // if (mesaController.mesaModel.pedidoCorrente != null) {
          //   pedidoController
          //       .carregaPedido(mesaController.mesaModel.pedidoCorrente);
          // }
          setDataTeste();
          Navigator.pushNamed(context, 'detalharMesa');
        } catch (err) {
          print('vish\n$err');
        }
      },
    );
  }

  void searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = Icon(
          Icons.close,
          color: Theme.of(context).indicatorColor,
        );
        this.appBarTitle = TextField(
          style: TextStyle(color: Theme.of(context).indicatorColor),
          autofocus: true,
          controller: _filter,
          onChanged: Session.mesaController.filtrar,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              // prefixIcon: Icon(Icons.search),
              hintText: 'Informe a Mesa',
              hintStyle: TextStyle(color: Theme.of(context).indicatorColor),
              errorText: null,
              errorStyle: TextStyle(color: Theme.of(context).indicatorColor)),
        );
      } else {
        this._searchIcon = Icon(
          Icons.search,
          color: Theme.of(context).indicatorColor,
        );
        this.appBarTitle = Text(title);
      }
    });
  }

  void setDataTeste() {
    Session.pedidoController.pedido.itens.add(ItemModel(
        idProduto: 1, descricao: "Coca Cola 350ml", qtde: 2, preco: 5));
    Session.pedidoController.pedido.itens.add(ItemModel(
        idProduto: 1, descricao: "Chopp Brahma 500ml", qtde: 3, preco: 9.5));
    Session.pedidoController.pedido.itens.add(ItemModel(
        idProduto: 1, descricao: "Coca Cola 350ml", qtde: 2, preco: 5));
    Session.pedidoController.pedido.itens.add(ItemModel(
        idProduto: 1, descricao: "Chopp Brahma 500ml", qtde: 3, preco: 9.5));
    Session.pedidoController.pedido.itens.add(ItemModel(
        idProduto: 1, descricao: "Coca Cola 350ml", qtde: 2, preco: 5));
    Session.pedidoController.pedido.itens.add(ItemModel(
        idProduto: 1, descricao: "Chopp Brahma 500ml", qtde: 3, preco: 9.5));
    Session.pedidoController.pedido.itens.add(ItemModel(
        idProduto: 1, descricao: "Coca Cola 350ml", qtde: 2, preco: 5));
    Session.pedidoController.pedido.itens.add(ItemModel(
        idProduto: 1, descricao: "Chopp Brahma 500ml", qtde: 3, preco: 9.5));
  }
}
