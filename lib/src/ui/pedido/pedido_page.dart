import 'package:MetreX/src/shared/util/Constants.dart';
import 'package:MetreX/src/shared/util/Session.dart';
import 'package:MetreX/src/ui/grupo/models/grupo_atendimento_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class PedidoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Session.grupoController.listarGrupoAtendimentos();
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context),
        body: buildContent(context),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("Grupos de Atendimento"),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            Session.grupoController.grupoModel = GrupoAtendimentoModel();
            Navigator.pushNamed(context, 'produto');
          },
        ),
      ],
    );
  }

  buildContent(BuildContext context) {
    return Observer(builder: (_) {
      return _gridGrupoAtendimento();
    });
  }

  Widget _gridGrupoAtendimento() {
    return GridView.builder(
      itemCount: Session.grupoController.gruposAtendimento.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 1.6),
      itemBuilder: (context, index) {
        return InkWell(
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Session.grupoController.gruposAtendimento[index].imagem.isEmpty
                    ? Icon(Icons.image)
                    : Image.network(
                        "${Constants.servidor}/resources/64px/${Session.grupoController.gruposAtendimento[index].imagem}.png",
                        width: 30,
                      ),
                Text(
                  Session.grupoController.gruposAtendimento[index].descricao,
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          onTap: () {
            Session.grupoController.grupoModel =
                Session.grupoController.gruposAtendimento[index];
            Navigator.pushNamed(context, 'produto');
          },
        );
      },
    );
  }
}
