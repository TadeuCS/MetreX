import 'package:MetreX/src/shared/contents/custom_dialog.dart';
import 'package:flutter/material.dart';

class FormaRecebimentoPage extends StatefulWidget {
  @override
  _FormaRecebimentoPageState createState() => _FormaRecebimentoPageState();
}

class _FormaRecebimentoPageState extends State<FormaRecebimentoPage> {
  bool isAdiantamento = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecione a Forma'),
        centerTitle: true,
      ),
      body: content(context),
      // floatingActionButton:
      //     FloatingActionButton(child: Icon(Icons.check), onPressed: () {}),
    );
  }

  content(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: <Widget>[
                Text(
                  'Adiantamento',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Switch(
                    activeColor: Theme.of(context).primaryColor,
                    value: isAdiantamento,
                    onChanged: (value) {
                      setState(() {
                        isAdiantamento = value;
                      });
                    }),
                Expanded(
                  child: isAdiantamento
                      ? TextFormField(
                          decoration: InputDecoration(labelText: 'Nome'),
                        )
                      : Container(),
                ),
              ],
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            // padding: const EdgeInsets.all(5),
            crossAxisSpacing: 5,
            crossAxisCount: 3,
            childAspectRatio: 1.5,
            children: <Widget>[
              itemForma(
                  context, Color(0xff4caf50), 'Dinheiro', Icons.attach_money),
              itemForma(
                  context, Color(0xffffc107), 'Cartão', Icons.credit_card),
              itemForma(context, Color(0xff2196f3), 'Personalizado',
                  Icons.call_to_action),
            ],
          )
        ],
      ),
    );
  }

  itemForma(BuildContext context, Color color, String label, IconData icone) {
    return InkWell(
      onTap: () {
        showInputNumberDialog(context, 'Confirmação', 'Digite o valor:')
            .then((confirm) {
          if (confirm) {
            Navigator.pop(context);
          }
        });
      },
      child: Container(
        // color: Color(0xff4caf50),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icone, size: 30),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(color: Theme.of(context).indicatorColor),
            ),
          ],
        ),
      ),
    );
  }
}
