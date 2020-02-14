import 'package:flutter/material.dart';

showNotification(
    {@required GlobalKey<ScaffoldState> scaffoldKey,
    @required String msg,
    Duration duration,
    Color color}) {
  scaffoldKey.currentState.showSnackBar(SnackBar(
    duration: duration == null ? Duration(seconds: 2) : duration,
    backgroundColor: color == null ? Colors.redAccent : color,
    content: Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.info_outline),
        ),
        Expanded(child: Text(msg)),
      ],
    ),
  ));
}
