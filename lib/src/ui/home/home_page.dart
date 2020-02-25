import 'package:MetreX/src/shared/util/Session.dart';
import 'package:MetreX/src/ui/caixa/models/caixa_item_model.dart';
import 'package:MetreX/src/ui/caixa/models/caixa_model.dart';
import 'package:MetreX/src/ui/mesa/mesa_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: MesaPage(),
        bottomNavigationBar: bottomNavigator(),
      ),
    );
  }

  bottomNavigator() {
    return BottomNavigationBar(
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        onTap: onTabTapped,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_on),
            title: Text('Mesas'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_atm),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Container(),
          ),
        ]);
  }

  void onTabTapped(int index) {
    switch (index) {
      case 1:
        Navigator.pushNamed(context, 'caixa');
        break;
      case 2:
        Navigator.pushNamed(context, 'configuracao');
        break;
      default:
    }
  }
}
