import 'package:MetreX/src/caixa/caixa_page.dart';
import 'package:MetreX/src/configuracao/configuracao_page.dart';
import 'package:MetreX/src/mesa/mesa_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        body: content(context),
        bottomNavigationBar: bottomNavigator(),
      ),
    );
  }

  bottomNavigator() {
    return BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).indicatorColor,
        unselectedItemColor: Colors.white38,
        showSelectedLabels: true,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_on),
            title: _currentIndex == 0 ? Text('Mesas') : Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_atm),
            title: _currentIndex == 1 ? Text('Caixa') : Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: _currentIndex == 2 ? Text('Configuração') : Container(),
          ),
        ]);
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  content(BuildContext context) {
    switch (_currentIndex) {
      case 1:
        return CaixaPage();
      case 2:
        return ConfigurcaoPage();
      default:
        return MesaPage();
    }
  }
}
