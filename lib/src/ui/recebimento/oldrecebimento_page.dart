import 'package:flutter/material.dart';

class RecebimentoPage extends StatefulWidget {
  @override
  _RecebimentoPageState createState() => _RecebimentoPageState();
}

class _RecebimentoPageState extends State<RecebimentoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recebimento'),
        centerTitle: true,
      ),
      body: buildContent(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  ListView buildContent() {
    return ListView(
      padding: const EdgeInsets.all(5),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Forma de Pagamento',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          Image.network(
                            'https://image.freepik.com/psd-gratuitas/icone-de-dinheiro-financiamento-psd-simbolo_30-2336.jpg',
                            height: 100,
                            width: 120,
                          ),
                          Text('Dinheiro')
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                  InkWell(
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          Image.network(
                            'https://www.omni.com.br/assets/upload/media/images/total.png',
                            height: 100,
                            width: 120,
                          ),
                          Text('Cartão')
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                  InkWell(
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          Image.network(
                            'https://www.pinclipart.com/picdir/big/152-1524963_other-b2b-icon-images-youtube-round-logo-blue.png',
                            height: 100,
                            width: 120,
                          ),
                          Text('Personalizado')
                        ],
                      ),
                    ),
                    onTap: () {},
                  )
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Lista de Pagamentos',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey),
              ),
              ListTile(
                leading: Icon(Icons.monetization_on, color: Colors.lightGreen,),
                title: Text('Dinheiro'),
                subtitle: Text('R\$ 10,00'),
                trailing: IconButton(icon: Icon(Icons.delete), onPressed: (){}),
              ),
              ListTile(
                leading: Icon(Icons.credit_card, color: Colors.orangeAccent,),
                title: Text('Cartão'),
                subtitle: Text('R\$ 20,00'),
                trailing: IconButton(icon: Icon(Icons.delete), onPressed: (){}),
              ),
              ListTile(
                leading: Icon(Icons.featured_play_list, color: Colors.lightBlue,),
                title: Text('Personalizado'),
                subtitle: Text('R\$ 30,00'),
                trailing: IconButton(icon: Icon(Icons.delete), onPressed: (){}),
              ),
            ],
          ),
        ),
      ],
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.cancel),
            title: new Text('Cancelar'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.remove),
            title: new Text('Desconto'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            title: Text('Acréscimo'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.room_service),
            title: Text('Taxas'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.check_circle_outline),
            title: new Text('Finalizar'),
          ),
        ]);
  }
}
