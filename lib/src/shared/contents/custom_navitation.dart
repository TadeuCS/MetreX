import 'package:flutter/material.dart';

goToPage(BuildContext context, String page, bool replace, bool popOldPage) {
  if (replace) {
    Navigator.pushReplacementNamed(context, page);
  } else {
    if(popOldPage){
      Navigator.pop(context);
    }
    Navigator.pushNamed(context, page);
  }
}