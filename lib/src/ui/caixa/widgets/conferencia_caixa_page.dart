import 'package:MetreX/src/shared/util/OUtil.dart';
import 'package:MetreX/src/shared/util/Session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ConferenciaCaixaPage extends StatefulWidget {
  @override
  _ConferenciaCaixaPageState createState() => _ConferenciaCaixaPageState();
}

class _ConferenciaCaixaPageState extends State<ConferenciaCaixaPage> {
  var _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    Session.caixaController.listarFechamentos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conferência do Caixa'),
        centerTitle: true,
      ),
      body: _content(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Session.caixaController.fechamentos
              .forEach((f) => print(f.valorInformado));
        },
        child: Icon(Icons.check),
      ),
    );
  }

  _content() {
    return Form(
      key: _formKey,
      child: ListView(padding: const EdgeInsets.all(10), children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Forma',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            Text(
              'Valor Calculado',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            Text(
              'Valor Informado',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
          ],
        ),
        Divider(),
        Column(
          children: Session.caixaController.fechamentos.map((f) {
            var controller = MoneyMaskedTextController(
                decimalSeparator: ',', thousandSeparator: '.');
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(child: Text(f.forma)),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      OUtil.formataMoeda(f.valorCalculado),
                      textAlign: TextAlign.right,
                    ),
                  )),
                  Expanded(
                    child: Container(
                      height: 50,
                      // child: FocusScope(
                      //   child: Focus(
                      //     onFocusChange: (focus){
                      //       var old = f;
                      //       f.valorInformado = OUtil.getDoubleByMoney(controller.text);
                      //       Session.caixaController.alteraFechamento(old, f);
                      //     },
                      child: TextFormField(
                        key: UniqueKey(),
                        textAlign: TextAlign.right,
                        controller: controller,
                        keyboardType: TextInputType.number,
                        onChanged: (text) {
                          var old = f;
                          f.valorInformado =
                              OUtil.getDoubleByMoney(controller.text);
                          Session.caixaController.alteraFechamento(old, f);
                        },
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                      ),
                      //   ),
                      // ),
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        ),
        Divider(),
        Observer(builder: (_) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Total: ',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
              ),
              Text(
                OUtil.formataMoeda(Session.caixaController.valorTotalCalculado),
                textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
              ),
              Text(
                OUtil.formataMoeda(Session.caixaController.valorTotalInformado),
                textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
              )
            ],
          );
        })
      ]),
    );
  }
}
