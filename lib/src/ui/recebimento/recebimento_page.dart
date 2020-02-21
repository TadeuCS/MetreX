import 'package:MetreX/src/shared/contents/custom_dialog.dart';
import 'package:MetreX/src/ui/recebimento/widget/custom_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RecebimentoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: SliverAppBar(expandedHeight: 160),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((_, index) {
                return Column(
                  // padding: const EdgeInsets.symmetric(vertical: 5),
                  children: <Widget>[
                    // Text(
                    //   'Lista de Pagamentos',
                    //   style: TextStyle(
                    //       fontSize: 20,
                    //       fontWeight: FontWeight.w700,
                    //       color: Colors.grey),
                    // ),
                    ListTile(
                      leading: Icon(
                        Icons.monetization_on,
                        color: Colors.lightGreen,
                      ),
                      title: Text('Dinheiro'),
                      subtitle: Text('R\$ 10,00'),
                      trailing: IconButton(
                          icon: Icon(Icons.delete), onPressed: () {}),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.monetization_on,
                        color: Colors.lightGreen,
                      ),
                      title: Text('Dinheiro'),
                      subtitle: Text('R\$ 10,00'),
                      trailing: IconButton(
                          icon: Icon(Icons.delete), onPressed: () {}),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.monetization_on,
                        color: Colors.lightGreen,
                      ),
                      title: Text('Dinheiro'),
                      subtitle: Text('R\$ 10,00'),
                      trailing: IconButton(
                          icon: Icon(Icons.delete), onPressed: () {}),
                    ),

                    ListTile(
                      leading: Icon(
                        Icons.credit_card,
                        color: Colors.orangeAccent,
                      ),
                      title: Text('Cartão'),
                      subtitle: Text('R\$ 20,00'),
                      trailing: IconButton(
                          icon: Icon(Icons.delete), onPressed: () {}),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.credit_card,
                        color: Colors.orangeAccent,
                      ),
                      title: Text('Cartão'),
                      subtitle: Text('R\$ 20,00'),
                      trailing: IconButton(
                          icon: Icon(Icons.delete), onPressed: () {}),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.credit_card,
                        color: Colors.orangeAccent,
                      ),
                      title: Text('Cartão'),
                      subtitle: Text('R\$ 20,00'),
                      trailing: IconButton(
                          icon: Icon(Icons.delete), onPressed: () {}),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.featured_play_list,
                        color: Colors.lightBlue,
                      ),
                      title: Text('Personalizado'),
                      subtitle: Text('R\$ 30,00'),
                      trailing: IconButton(
                          icon: Icon(Icons.delete), onPressed: () {}),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.featured_play_list,
                        color: Colors.lightBlue,
                      ),
                      title: Text('Personalizado'),
                      subtitle: Text('R\$ 30,00'),
                      trailing: IconButton(
                          icon: Icon(Icons.delete), onPressed: () {}),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.featured_play_list,
                        color: Colors.lightBlue,
                      ),
                      title: Text('Personalizado'),
                      subtitle: Text('R\$ 30,00'),
                      trailing: IconButton(
                          icon: Icon(Icons.delete), onPressed: () {}),
                    ),
                  ],
                );
              }, childCount: 1),
            ),
          ],
        ),
        bottomNavigationBar: buildBottomNavigationBar(context),
      ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        onTap: (index) {
          switch (index) {
            case 0:
              showInputTextDialog(
                  context, 'Motivo Cancelamento', 'Informe o motivo');
              break;
            case 1:
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CustomPage('Desconto')));
              break;
            case 2:
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CustomPage('Acréscimo')));
              break;
            case 3:
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CustomPage('Taxa de Serviço')));
              break;
            default:
              Navigator.pop(context);
              Navigator.pop(context);
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.cancel),
            title: new Text('Cancelar'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.remove),
            title: new Text('Desconto'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            title: Text('Acréscimo'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.room_service),
            title: Text('Taxas'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.check_circle_outline),
            title: new Text('Finalizar'),
          ),
        ]);
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
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () => Navigator.pushNamed(context, 'forma'),
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
                                  'R\$ 850,00',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                Text(
                                  'Total',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                )
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  'R\$ 650,00',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                Text(
                                  'Recebido',
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
                              "R\$ 250,00",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 23,
                              ),
                            ),
                            Text(
                              'Restante',
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
              "R\$ 250,00",
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
