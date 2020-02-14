// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class CustomPopUpMenuButton extends StatefulWidget {
  final List<Widget> listOptions;

  CustomPopUpMenuButton(this.listOptions);

  @override
  _CustomPopUpMenuButtonState createState() => _CustomPopUpMenuButtonState();
}

class _CustomPopUpMenuButtonState extends State<CustomPopUpMenuButton> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Widget>(
      itemBuilder: (BuildContext context) {
        return widget.listOptions.map((Widget button) {
          return PopupMenuItem<Widget>(
            value: button,
            child: button,
          );
        }).toList();
      },
    );
  }
}
