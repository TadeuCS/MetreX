import 'package:MetreX/src/shared/util/Session.dart';
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
            children: Session.mesaController.mesasFiltradas
                .map((e) => gridItem(e))
                .toList(),
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
        carregarMesa(mesaModel.numeroMesa);
      },
    );
  }

  void searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        openSearchBar();
      } else {
        closeSearchBar();
      }
    });
  }

  void closeSearchBar() {
    this._searchIcon = Icon(
      Icons.search,
      color: Theme.of(context).indicatorColor,
    );
    this.appBarTitle = Text(title);
    _filter.clear();
    Session.mesaController.filtrar('');
  }

  void openSearchBar() {
    this._searchIcon = Icon(
      Icons.close,
      color: Theme.of(context).indicatorColor,
    );
    this.appBarTitle = TextField(
      style: TextStyle(color: Theme.of(context).indicatorColor),
      autofocus: true,
      controller: _filter,
      onChanged: Session.mesaController.filtrar,
      onEditingComplete: () {
        carregarMesa(_filter.text.trim());
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          // prefixIcon: Icon(Icons.search),
          hintText: 'Informe a Mesa',
          hintStyle: TextStyle(color: Theme.of(context).indicatorColor),
          errorText: null,
          errorStyle: TextStyle(color: Theme.of(context).indicatorColor)),
    );
  }

  void carregarMesa(String numeroMesa) {
    searchPressed();
    if (numeroMesa != null && numeroMesa.isNotEmpty) {
      Session.mesaController.abrirMesa(numeroMesa, context);
      closeSearchBar();
    }
  }
}
