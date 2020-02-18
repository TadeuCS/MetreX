import 'package:MetreX/src/ui/pedido/controllers/pedido_controller.dart';
import 'package:MetreX/src/ui/pedido/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'controllers/mesa_controller.dart';
import 'models/mesa_model.dart';

class MesaPage extends StatefulWidget {
  @override
  _MesaPageState createState() => _MesaPageState();
}

class _MesaPageState extends State<MesaPage> {
  static final String title = 'Metre X';
  Icon _searchIcon = Icon(Icons.search);
  Widget appBarTitle = Text(title);
  MesaController mesaController = GetIt.I.get<MesaController>();
  PedidoController pedidoController = GetIt.I.get<PedidoController>();
  TextEditingController _filter = TextEditingController();

  @override
  void initState() {
    super.initState();
    mesaController.listarTodas();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Observer(builder: (_) {
        return Scaffold(
          appBar: AppBar(
              centerTitle: true,
              title: appBarTitle,
              leading: new IconButton(
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
    return mesaController.mesasFiltradas.isEmpty
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
                mesaController.mesasFiltradas.map((e) => gridItem(e)).toList(),
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
        
        mesaController.mesaModel = mesaModel;
        try {
          mesaController.abrirMesa();
          if (mesaController.mesaModel.pedidoCorrente != null) {
            pedidoController
                .carregaPedido(mesaController.mesaModel.pedidoCorrente);
            setDataTeste();
          }
          Navigator.pushNamed(context, 'novaMesa');
        } catch (err) {
          print('vish');
        }
      },
    );
  }

  void searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(
          Icons.close,
          color: Theme.of(context).indicatorColor,
        );
        this.appBarTitle = new TextField(
          style: TextStyle(color: Theme.of(context).indicatorColor),
          controller: _filter,
          onChanged: mesaController.filtrar,
          keyboardType: TextInputType.number,
          decoration: new InputDecoration(
              // prefixIcon: new Icon(Icons.search),
              hintText: 'Informe a Mesa',
              hintStyle: TextStyle(color: Theme.of(context).indicatorColor),
              errorText: null,
              errorStyle: TextStyle(color: Theme.of(context).indicatorColor)),
        );
      } else {
        this._searchIcon = new Icon(
          Icons.search,
          color: Theme.of(context).indicatorColor,
        );
        this.appBarTitle = new Text(title);
      }
    });
  }

  void setDataTeste() {
    pedidoController.pedido.itens.add(ItemModel(
        idProduto: 1, descricao: "Coca Cola 350ml", qtde: 2, preco: 5));
    pedidoController.pedido.itens.add(ItemModel(
        idProduto: 1, descricao: "Chopp Brahma 500ml", qtde: 3, preco: 9.5));
    pedidoController.pedido.itens.add(ItemModel(
        idProduto: 1, descricao: "Coca Cola 350ml", qtde: 2, preco: 5));
    pedidoController.pedido.itens.add(ItemModel(
        idProduto: 1, descricao: "Chopp Brahma 500ml", qtde: 3, preco: 9.5));
    pedidoController.pedido.itens.add(ItemModel(
        idProduto: 1, descricao: "Coca Cola 350ml", qtde: 2, preco: 5));
    pedidoController.pedido.itens.add(ItemModel(
        idProduto: 1, descricao: "Chopp Brahma 500ml", qtde: 3, preco: 9.5));
    pedidoController.pedido.itens.add(ItemModel(
        idProduto: 1, descricao: "Coca Cola 350ml", qtde: 2, preco: 5));
    pedidoController.pedido.itens.add(ItemModel(
        idProduto: 1, descricao: "Chopp Brahma 500ml", qtde: 3, preco: 9.5));
  }
}
