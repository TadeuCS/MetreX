import 'dart:io';
import 'package:MetreX/src/shared/util/OUtil.dart';
import 'package:flutter/material.dart';

class CustomAvatar extends StatelessWidget {
  final File foto;
  final String source;
  final String url;
  final String base64;
  final double size;
  final BoxFit fit = BoxFit.cover;

  CustomAvatar({this.size, this.source, this.url, this.foto, this.base64});

  @override
  Widget build(BuildContext context) {
    // 'https://via.placeholder.com/150'
    var _img;
    if (foto != null) {
      _img = Image.file(
        foto,
        width: size,
        height: size,
        fit: fit,
      ); //Foto tirada
    }else if(base64!=null){
      _img = Image.memory(
        OUtil.convertBase64ToImage(base64),
        width: size,
        height: size,
        fit: fit,
      );
    } else if (source != null) {
      _img = Image.asset(
        source,
        width: size,
        height: size,
        fit: fit,
      ); //Foto upada
    } else {
      _img = Image.network(
        'https://sites.usp.br/scx/wp-content/uploads/sites/262/2017/06/person-1.png',
        width: size,
        height: size,
        fit: fit,
      ); // Sem foto
    }
    return ClipOval(
      child: _img,
    );
  }
}
