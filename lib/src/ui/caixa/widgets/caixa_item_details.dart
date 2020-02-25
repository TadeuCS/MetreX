import 'package:MetreX/src/shared/contents/custom_output_label.dart';
import 'package:MetreX/src/shared/util/OUtil.dart';
import 'package:MetreX/src/ui/caixa/models/caixa_item_model.dart';
import 'package:flutter/material.dart';

class CaixaItemPage extends StatelessWidget {
  final CaixaItemModel ci;

  CaixaItemPage(this.ci);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // GestureDetector(
        //     child: Icon(
        //       Icons.close,
        //       color: Colors.grey,
        //     ),
        //     onTap: () => Navigator.pop(context)),
        // Icon(
        //   Icons.expand_more,
        //   color: Colors.grey,
        // ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ci.tipo == 'C'
                  ? Icon(
                      Icons.arrow_upward,
                      color: Colors.green,
                    )
                  : Icon(
                      Icons.arrow_downward,
                      color: Colors.red,
                    ),
              Text(
                ci.tipoMovimento,
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.grey,
        ),
        CustomOutputLabel(
          'Forma: ',
          ci.forma,
        ),
        CustomOutputLabel(
          'Data/Hora: ',
          ci.dataHora,
        ),
        CustomOutputLabel(
          'Valor: ',
          OUtil.formataMoeda(ci.valor),
        ),
        CustomOutputLabel(
          'Histórico: ',
          ci.historico,
          softWrap: true,
        ),
      ],
    );
  }
}
