import 'package:MetreX/src/shared/contents/custom_dialog.dart';
import 'package:MetreX/src/shared/util/OUtil.dart';
import 'package:MetreX/src/shared/util/Session.dart';
import 'package:MetreX/src/ui/caixa/models/caixa_item_model.dart';
import 'package:MetreX/src/ui/caixa/widgets/caixa_item_details.dart';
import 'package:flutter/material.dart';

import 'models/caixa_model.dart';

class CaixaPage extends StatefulWidget {
  @override
  _CaixaPageState createState() => _CaixaPageState();
}

class _CaixaPageState extends State<CaixaPage> {
  var scaffouldKey = GlobalKey<ScaffoldState>();
  // int _currentIndex = 0;

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffouldKey,
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: SliverAppBar(expandedHeight: 160),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((_, index) {
                return _content();
              }, childCount: 1),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: Icon(
            Icons.check,
          ),
          onPressed: () =>Navigator.pushNamed(context, 'conferencia'),
        ),
        // bottomNavigationBar: _bottomNavigationBar(),
      ),
    );
  }

  // _bottomNavigationBar() {
  //   return BottomNavigationBar(
  //       selectedItemColor: Colors.grey,
  //       unselectedItemColor: Colors.grey,
  //       showSelectedLabels: true,
  //       onTap: onTabTapped,
  //       currentIndex: _currentIndex,
  //       items: [
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.add_circle),
  //           title: Text('Abrir Caixa'),
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.check_circle),
  //           title: Text('Fechar Caixa'),
  //         ),
  //       ]);
  // }

  // void onTabTapped(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //   });
  // }

  _content() {
    return Column(
      children: Session.caixaController.caixaModel.itens
          .map((e) => buildListTile(e))
          .toList(),
    );
  }

  Dismissible buildListTile(CaixaItemModel ci) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
        child: Center(
            child: Text(
          'Estorno de Lançamento',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
        )),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (value) {
        return showConfirmDialog(
                context, 'Atenção', 'Deseja estornar este lançamento?')
            .then((value) {
          if (value) {
            print('Estorna este caixa_item!');
            return true;
          } else {
            return false;
          }
        });
      },
      child: ListTile(
        leading: ci.tipoMovimento == 'C'
            ? Icon(
                Icons.arrow_upward,
                color: Colors.green[600],
              )
            : Icon(
                Icons.arrow_downward,
                color: Colors.red[600],
              ),
        title: Text(ci.tipo),
        subtitle: Text(ci.dataHora),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              ci.forma,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
            Text(
              OUtil.formataMoeda(ci.valor),
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
          ],
        ),
        onTap: () {
          // Navigator.of(scaffouldKey.currentContext).push(_createRoute(scaffouldKey.currentContext));
          detailCaixaItem(ci);
        },
      ),
    );
  }

  void detailCaixaItem(CaixaItemModel ci) async {
    var alert = AlertDialog(
      title: CaixaItemPage(ci),
    );
    await showDialog(
      context: scaffouldKey.currentContext,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void getData() {
    List<CaixaItemModel> itens = List();
    itens.add(CaixaItemModel(
      dataHora: '20/02/2020 10:37:12',
      tipo: 'Abertura',
      historico: 'Abertura de Caixa',
      tipoMovimento: 'C',
      valor: 50,
      forma: 'Dinheiro',
    ));
    itens.add(CaixaItemModel(
      dataHora: '20/02/2020 16:37:12',
      tipo: 'Recebimento',
      historico: 'Recebimento do Pedido 1',
      tipoMovimento: 'C',
      valor: 50,
      forma: 'Dinheiro',
    ));
    itens.add(CaixaItemModel(
      dataHora: '20/02/2020 16:40:12',
      tipo: 'Recebimento',
      historico: 'Recebimento do Pedido 2',
      tipoMovimento: 'C',
      valor: 50,
      forma: 'C. Débito',
    ));
    itens.add(CaixaItemModel(
      dataHora: '20/02/2020 16:55:12',
      tipo: 'Pagamento',
      historico: 'Pagamento do Fornecedor X dos produtos Laranja e limão',
      tipoMovimento: 'D',
      valor: 50,
      forma: 'Dinheiro',
    ));
    itens.add(CaixaItemModel(
      dataHora: '20/02/2020 16:40:12',
      tipo: 'Recebimento',
      historico: 'Recebimento do Pedido 3',
      tipoMovimento: 'C',
      valor: 60,
      forma: 'C. Crédito',
    ));
    itens.add(CaixaItemModel(
      dataHora: '20/02/2020 16:37:12',
      tipo: 'Sangria',
      historico: 'Sangria de valor do caixa',
      tipoMovimento: 'D',
      valor: 30,
      forma: 'Dinheiro',
    ));
    itens.add(CaixaItemModel(
      dataHora: '20/02/2020 16:37:12',
      tipo: 'Estorno',
      historico: 'Estorno do recebimento do Pedido 2',
      tipoMovimento: 'D',
      valor: 50,
      forma: 'C. Débito',
    ));
    itens.add(CaixaItemModel(
      dataHora: '20/02/2020 16:37:12',
      tipo: 'Credito',
      historico: 'Recebimento de Crédito de cliente',
      tipoMovimento: 'C',
      valor: 50,
      forma: 'Dinheiro',
    ));
    itens.add(CaixaItemModel(
      dataHora: '20/02/2020 18:30:00',
      tipo: 'Vale',
      historico: 'Vale de Funcionário',
      tipoMovimento: 'D',
      valor: 30.5,
      forma: 'Dinheiro',
    ));
    CaixaModel caixa = CaixaModel(
        idCaixa: 1,
        dataAbertura: '25/02/2020 13:14',
        entradas: 100,
        saidas: 50,
        saldo: 50,
        usuario: Session.usuarioController.usuarioModel,
        turno: 'Manha - 1',
        itens: itens);
    Session.caixaController.carregarCaixa(caixa);
  }
}

class SliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  SliverAppBar({@required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      // fit: StackFit.expand,
      // overflow: Overflow.visible,
      children: [
        Container(
          color: Theme.of(context).primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ListView(
            children: <Widget>[ 
              Container(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              Opacity(
                opacity: (1 - shrinkOffset / expandedHeight),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                  OUtil.formataMoeda(Session
                                      .caixaController.caixaModel.entradas),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                Text(
                                  'Saídas',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                )
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  OUtil.formataMoeda(
                                      Session.caixaController.caixaModel.saldo),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                Text(
                                  'Entradas',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Column(
                          children: <Widget>[
                            Text(
                              OUtil.formataMoeda(
                                  Session.caixaController.caixaModel.saldo),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 23,
                              ),
                            ),
                            Text(
                              'Saldo',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Opacity(
          opacity: shrinkOffset / expandedHeight,
          child: Center(
            child: Text(
              OUtil.formataMoeda(Session.caixaController.caixaModel.saldo),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 23,
              ),
            ),
          ),
        ),
        // Positioned(
        //   top: expandedHeight / 2 - shrinkOffset,
        //   left: MediaQuery.of(context).size.width / 4,
        //   child: Opacity(
        //     opacity: (1 - shrinkOffset / expandedHeight),
        //     child: Card(
        //       elevation: 10,
        //       child: SizedBox(
        //         height: expandedHeight,
        //         width: MediaQuery.of(context).size.width / 2,
        //         child: FlutterLogo(),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
