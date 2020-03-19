import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class CustomPage extends StatefulWidget {
  final String title;

  CustomPage(this.title);

  @override
  _CustomPageState createState() => _CustomPageState();
}

class _CustomPageState extends State<CustomPage> {
  bool isPercentual = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: content(),
        floatingActionButton: fab(),
      ),
    );
  }

  FloatingActionButton fab() =>
      FloatingActionButton(child: Icon(Icons.check), onPressed: () {});

  ListView content() {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: <Widget>[
        Container(
          height: 50,
          child: RaisedButton(
              color: isPercentual ? Colors.blue : Colors.green,
              child: Text(
                isPercentual ? 'Em Porcentagem (%)' : 'Em Reais (R\$)',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                setState(() {
                  isPercentual = !isPercentual;
                });
              }),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  controller: MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: '.'),
                  autofocus: true,
                  textAlign: TextAlign.end,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixText: isPercentual ? '%' : 'R\$',
                    labelText: 'Total',
                  ),
                ),
              ),
              IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: Colors.redAccent,
                  ),
                  onPressed: () {
                  })
            ],
          ),
        ),
        // Container(
        //   height: 50,
        //   child: RaisedButton(
        //       color: Colors.redAccent,
        //       child: Text(
        //         'Remover ${widget.title}',
        //         style: TextStyle(color: Colors.white),
        //       ),
        //       onPressed: () {}),
        // ),
      ],
    );
  }
}
