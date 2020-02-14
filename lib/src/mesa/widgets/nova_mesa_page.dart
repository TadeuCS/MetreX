import 'package:MetreX/src/mesa/controllers/mesa_controller.dart';
import 'package:MetreX/src/mesa/models/item_model.dart';
import 'package:MetreX/src/pedido/pedido_page.dart';
import 'package:MetreX/src/shared/contents/custom_item_totalizer.dart';
import 'package:MetreX/src/shared/contents/custom_submenu.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:get_it/get_it.dart';

class NovaMesaPage extends StatefulWidget {
  @override
  _NovaMesaPageState createState() => _NovaMesaPageState();
}

class _NovaMesaPageState extends State<NovaMesaPage>
    with TickerProviderStateMixin {
  MesaController mesaController = GetIt.I.get<MesaController>();
  AnimationController _fabAnimation;
  static const List<IconData> icons = const [
    Icons.print,
    Icons.monetization_on,
  ];

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
      child: Scaffold(
        // appBar: AppBar(),
        body: content(),
        floatingActionButton: buildFab(),
      ),
    );
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
                  onPressed: () {}),
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
          buildItens(),
          buildTotalizadores(),
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
              '${mesaController.mesaModel.numero}',
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
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Card(
          child: Stack(children: [
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: CustomSubMenu(descricao: "Itens", sufixWidget: FloatingActionButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'pedido');
                          },
                          child: Icon(Icons.add),
                        ),),
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
        ),
      ),
    );
  }

  buildTotalizadores() {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Card(
        child: Container(
          padding: const EdgeInsets.fromLTRB(80, 0, 80, 20),
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
        itemCount: mesaController.mesaModel.itens.length,
        itemBuilder: (_, index) {
          ItemModel e = mesaController.mesaModel.itens[index];
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
    rows.addAll(mesaController.mesaModel.itens
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
