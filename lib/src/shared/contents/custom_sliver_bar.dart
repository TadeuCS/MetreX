import 'package:flutter/material.dart';

class CustomSliverBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  CustomSliverBar({@required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Image.network(
          // "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          "https://img.freepik.com/fotos-gratis/tampo-da-mesa-de-madeira-vazio-com-cafetaria-borrada_7188-1337.jpg?size=626&ext=jpg",
          fit: BoxFit.cover,
        ),
        Center(
          child: Opacity(
            opacity: shrinkOffset / expandedHeight,
            child: Scaffold(
              drawer: Drawer(
                child: Container(),
              ),
              body: Text(
                "Conta 15",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 23,
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: Text(
              'Mesas',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        )
        // Positioned(
        //   top: expandedHeight / 2 - shrinkOffset,
        //   left: MediaQuery.of(context).size.width / 4,
        //   child: Opacity(
        //     opacity: (1 - shrinkOffset / expandedHeight),
        //     child: Card(
        //       elevation: 10,
        //       child: SizedBox(
        //         height: expandedHeight,
        //         width: MediaQuery.of(context).size.width / 2,
        //         child: FlutterLogo(),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
