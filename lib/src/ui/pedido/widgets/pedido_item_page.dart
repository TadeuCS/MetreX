import 'package:MetreX/src/shared/util/OUtil.dart';
import 'package:MetreX/src/shared/util/Session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class PedidoItemPage extends StatefulWidget {
  @override
  _PedidoItemPageState createState() => _PedidoItemPageState();
}

class _PedidoItemPageState extends State<PedidoItemPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Observer(builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Detalhes do Item'),
            centerTitle: true,
          ),
          body: buildContent(),
        );
      }),
    );
  }

  buildContent() {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                produtoDetail(),
                recados(),
              ],
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: footerButtons(),
        )
      ],
    );
    // return Container(
    //   padding: const EdgeInsets.all(10),
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: <Widget>[
    //       Padding(
    //         padding: const EdgeInsets.all(10),
    //         child: Column(
    //           children: <Widget>[
    //             produtoDetail(),
    //             recados()
    //           ],
    //         ),
    //       ),
    //       footerButtons(),
    //     ],
    //   ),
    // );
  }

  recados() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            RaisedButton(
                child: Text('SEM GELO', style: TextStyle(color: Colors.white)),
                onPressed: () {}),
            RaisedButton(
                child:
                    Text('SEM AÇUCAR', style: TextStyle(color: Colors.white)),
                onPressed: () {}),
            RaisedButton(
                child:
                    Text('GELO E LIMÃO', style: TextStyle(color: Colors.white)),
                onPressed: () {}),
          ],
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Icon(
                Icons.chat,
                color: Colors.black87,
              ),
            ),
            Text(
              'Recado',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            Expanded(
                child: Text(
              '0/255',
              textAlign: TextAlign.right,
            )),
          ],
        ),
        TextFormField(
          decoration: InputDecoration(
              hintText: 'Ex: Sem Cebola, Sem Gelo',
              border: OutlineInputBorder()),
        )
      ],
    );
  }

  Container produtoDetail() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              Session.produtoController.produtoModel.descricao,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
          ),
          Text(
            OUtil.formataMoeda(Session.produtoController.produtoModel.preco),
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 16, color: Colors.grey),
          ),
          Session.produtoController.temManualProducao()
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.grey[300],
                    child: Text(
                      Session.produtoController.produtoModel.manualProducao,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  Container footerButtons() {
    return MediaQuery.of(context).viewInsets.bottom > 0
        ? Container()
        : Container(
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.grey[400], width: 0.8))),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: null,
                          ),
                          Text('1'),
                          IconButton(
                              icon: Icon(
                                Icons.add,
                                color: Theme.of(context).primaryColor,
                              ),
                              onPressed: () {}),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: InkWell(
                      onTap: () {
                        print('cliquei');
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        height: 50,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Adicionar',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text('R\$ 5,00',
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
