import 'package:MetreX/src/mesa/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'controllers/mesa_controller.dart';
import 'models/mesa_model.dart';

class MesaPage extends StatefulWidget {
  @override
  _MesaPageState createState() => _MesaPageState();
}

class _MesaPageState extends State<MesaPage> {

  Icon _searchIcon;
  Widget appBarTitle = Icon(Icons.search);
  MesaController mesaController;

  List<MesaModel> mesasListadas = List();
  List<MesaModel> mesasFiltradas = List();

  final String title = 'Metre X';
  final TextEditingController _filter = new TextEditingController();

  @override
  void initState() {
    super.initState();
    mesasListadas = List.generate(30,
        (index) => MesaModel(id: index, numero: index.toString(), total: 10));
    mesasFiltradas = mesasListadas;
    appBarTitle = Text(title);
    _searchIcon = Icon(Icons.search);
    _filter.addListener(() {
      setState(() {
        mesasFiltradas = mesasListadas
            .where((e) => e.numero.startsWith(_filter.text))
            .toList();
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    mesaController = GetIt.I.get<MesaController>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: appBarTitle,
            leading: new IconButton(
              icon: _searchIcon,
              onPressed: searchPressed,
            )),
        // drawer: CustomDrawer(),
        body: content(context),
      ),
    );
  }

  
  content(BuildContext context) {
    return mesasFiltradas.isEmpty
        ? Center(
            child: Container(
              width: 150,
              height: 150,
              child: gridItem(
                  MesaModel(numero: _filter.text.trim(), total: 0), true),
            ),
          )
        : GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            children: mesasFiltradas.map((e) => gridItem(e, false)).toList(),
          );
  }

  Widget gridItem(MesaModel mesaModel, bool novaMesa) {
    return InkWell(
      onTap: () {
        mesaModel.itens.add(ItemModel(idProduto: 1, descricao: "Coca Cola 350ml", qtde: 2, preco: 5));
        mesaModel.itens.add(ItemModel(idProduto: 1, descricao: "Chopp Brahma 500ml", qtde: 3, preco: 9.5));
        mesaModel.itens.add(ItemModel(idProduto: 1, descricao: "Coca Cola 350ml", qtde: 2, preco: 5));
        mesaModel.itens.add(ItemModel(idProduto: 1, descricao: "Chopp Brahma 500ml", qtde: 3, preco: 9.5));
        mesaModel.itens.add(ItemModel(idProduto: 1, descricao: "Coca Cola 350ml", qtde: 2, preco: 5));
        mesaModel.itens.add(ItemModel(idProduto: 1, descricao: "Chopp Brahma 500ml", qtde: 3, preco: 9.5));
        mesaModel.itens.add(ItemModel(idProduto: 1, descricao: "Coca Cola 350ml", qtde: 2, preco: 5));
        mesaModel.itens.add(ItemModel(idProduto: 1, descricao: "Chopp Brahma 500ml", qtde: 3, preco: 9.5));
        mesaController.mesaModel = mesaModel;
        Navigator.pushNamed(context, 'novaMesa');
      },
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
                mesaModel.numero,
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
                  'R\$ ${mesaModel.total.toStringAsFixed(2)}',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
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
        mesasFiltradas = mesasListadas;
        _filter.clear();
      }
    });
  }
}