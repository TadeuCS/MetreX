import 'package:flutter/material.dart';

abstract class CrudBloc{

  Future<void> salvar(GlobalKey<ScaffoldState> scaffoldState);

  Future<void> editar(GlobalKey<ScaffoldState> scaffoldState);

  Future<bool> apagar(GlobalKey<ScaffoldState> scaffoldState);

  Future<List> listarTodos(GlobalKey<ScaffoldState> scaffoldState);

}