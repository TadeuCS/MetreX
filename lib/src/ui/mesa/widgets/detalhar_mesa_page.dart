import 'dart:math' as math;

import 'package:MetreX/src/shared/contents/custom_item_totalizer.dart';
import 'package:MetreX/src/shared/contents/custom_submenu.dart';
import 'package:MetreX/src/shared/util/Session.dart';
import 'package:MetreX/src/ui/pedido/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DetalharMesaPage extends StatefulWidget {
  @override
  _DetalharMesaPageState createState() => _DetalharMesaPageState();
}

class _DetalharMesaPageState extends State<DetalharMesaPage>
    with TickerProviderStateMixin {
  AnimationController _fabAnimation;
  static const List<IconData> icons = const [
    Icons.print,
    Icons.monetization_on,
  ];

  var pageController = PageController(initialPage: 0);
  var currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _fabAnimation = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Observer(builder: (_) {
        return Scaffold(
          // appBar: AppBar(),
          body: content(),
          // floatingActionButton: buildFab(),
          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: buildBottomNavigationBar(),
        );
      }),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        currentIndex: currentIndex,
        onTap: (index) {
          print('pagina clicada: $index');
          setState(() {
            currentIndex = index;
            switch (currentIndex) {
              case 2:
                currentIndex = 1;
                print('imprimindo...');
                break;
              case 3:
                currentIndex = 1;
                Navigator.pushNamed(context, 'recebimento');
                break;
              default:
                 print('não implementado!');
            }
            pageController.jumpToPage(currentIndex);
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.info),
            title: new Text('Itens'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            title: Text('Totalizadores'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.print),
            title: new Text('Imprimir'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.monetization_on),
            title: new Text('Receber'),
          ),
        ]);
  }

  Column buildFab() {
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          icons.length,
          (index) => Container(
            height: 70,
            width: 56,
            alignment: FractionalOffset.topCenter,
            child: ScaleTransition(
              scale: CurvedAnimation(
                parent: _fabAnimation,
                curve: Interval(0.0, 1.0 - index / icons.length / 2.0,
                    curve: Curves.easeOut),
              ),
              child: FloatingActionButton(
                  heroTag: null,
                  mini: true,
                  child: Icon(
                    icons[index],
                  ),
                  onPressed: () {
                    if (icons[index] == Icons.monetization_on) {
                      Navigator.pushNamed(context, 'recebimento');
                    }
                  }),
            ),
          ),
        ).toList()
          ..add(Container(
            child: FloatingActionButton(
                heroTag: null,
                child: AnimatedBuilder(
                    animation: _fabAnimation,
                    builder: (_, widget) {
                      return Transform(
                        transform: Matrix4.rotationZ(
                            _fabAnimation.value * 0.5 * math.pi),
                        alignment: FractionalOffset.center,
                        child: Icon(_fabAnimation.isDismissed
                            ? Icons.open_with
                            : Icons.close),
                      );
                    }),
                onPressed: () {
                  if (_fabAnimation.isDismissed)
                    _fabAnimation.forward();
                  else
                    _fabAnimation.reverse();
                }),
          )));
  }

  content() {
    return Container(
      child: Column(
        children: <Widget>[
          buildNumConta(),
          Expanded(
            child: PageView(
              controller: pageController,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: <Widget>[
                buildItens(),
                buildTotalizadores(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildNumConta() {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: 2),
          alignment: Alignment.centerLeft,
          child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () => Navigator.pop(context)),
        ),
        Center(
          child: Container(
            alignment: Alignment.center,
            height: 60,
            width: 150,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30))),
            child: Text(
              '${Session.mesaController.mesaModel.numeroMesa}',
              style: TextStyle(
                  color: Theme.of(context).indicatorColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  buildItens() {
    return Card(
      child: Stack(children: [
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: CustomSubMenu(
                descricao: "Itens",
                sufixWidget: FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'pedido');
                  },
                  child: Icon(Icons.add),
                ),
              ),
            ),
            // Divider(),
            Expanded(
              child: ListView(
                // physics: ScrollPhysics(),
                // shrinkWrap: true,
                children: <Widget>[
                  // buildTable(),
                  buildList(),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }

  buildTotalizadores() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            CustomSubMenu(descricao: "Totalizadores"),
            CustomItemTotalizer(
              label: '(+) SubTotal: ',
              value: 'R\$ 200,00',
            ),
            CustomItemTotalizer(
              label: '(+) Acréscimo: ',
              value: 'R\$ 1,00',
            ),
            CustomItemTotalizer(
              label: '(+) Taxa Serviço: ',
              value: 'R\$ 20,00',
            ),
            CustomItemTotalizer(
              label: '(+) Couvert: ',
              value: 'R\$ 10,00',
            ),
            CustomItemTotalizer(
              label: '(-) Desconto: ',
              value: 'R\$ 2,00',
            ),
            CustomItemTotalizer(
              label: '(-) Recebido: ',
              value: 'R\$ 20,00',
            ),
            CustomItemTotalizer(
              label: '(=) Total: ',
              value: 'R\$ 209,00',
              isTotalizer: true,
            ),
          ],
        ),
      ),
    );
  }

  Container buildList() {
    return Container(
      // color: Colors.grey[300],
      child: ListView.separated(
        physics: ScrollPhysics(),
        separatorBuilder: (_, index) => Divider(),
        shrinkWrap: true,
        itemCount: Session.pedidoController.pedido.itens.length,
        itemBuilder: (_, index) {
          ItemModel e = Session.pedidoController.pedido.itens[index];
          return ListTile(
            title: Text(e.descricao),
            subtitle: Text('${e.qtde} x ${e.preco} = ${e.total}'),
            trailing: IconButton(
                icon: Icon(
                  Icons.delete_forever,
                  color: Colors.redAccent,
                ),
                onPressed: () {}),
          );
        },
      ),
    );
  }

  Table buildTable() {
    return Table(
      // defaultColumnWidth: FixedColumnWidth(100),
      columnWidths: {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(1),
        3: FlexColumnWidth(1)
      },
      border: TableBorder(
          horizontalInside: BorderSide(
              color: Colors.black, style: BorderStyle.solid, width: 1),
          verticalInside: BorderSide(
              color: Colors.black, style: BorderStyle.solid, width: 1)),
      children: _buildTableRows(),
    );
  }

  List<TableRow> _buildTableRows() {
    List<TableRow> rows = List();
    rows.add(_buildRow(["Produto", "Qtde", "Preço", "Total"], true));
    rows.addAll(Session.pedidoController.pedido.itens
        .map((e) => _buildRow([
              e.descricao,
              e.qtde.toStringAsFixed(3),
              e.preco.toStringAsFixed(2),
              e.total.toStringAsFixed(2),
            ], false))
        .toList());
    return rows;
  }

  TableRow _buildRow(List<String> columns, bool isHeader) {
    return TableRow(
        children: columns
            .map((e) => Text(
                  e,
                  textAlign: TextAlign.center,
                  style: isHeader
                      ? TextStyle(fontWeight: FontWeight.w800)
                      : TextStyle(),
                ))
            .toList());
  }
}
