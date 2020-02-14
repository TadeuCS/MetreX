import 'package:flutter/material.dart';

class CaixaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Caixa'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 100,
              child: Card(
                child: Text('Teste Daniel'),
              ),
            ),
            SizedBox(
              height: 100,
              child: Card(
                child: Text('Teste Daniel'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
