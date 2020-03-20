import 'package:flutter/material.dart';

class GrupoAtendimentoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 60,
                width: 140,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.8),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Center(
                    child: Text(
                  '17',
                  style: TextStyle(
                      color: Theme.of(context).indicatorColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                )),
              )
            ],
          ),
        ),
        GridView.count(
          crossAxisCount: 3,
          physics: ScrollPhysics(),
          shrinkWrap: true,
          children: List.generate(
              15,
              (index) => Card(
                    child: Text('Index $index'),
                  )),
        ),
      ],
    );
  }
}
