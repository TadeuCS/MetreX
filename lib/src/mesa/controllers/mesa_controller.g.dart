// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mesa_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MesaController on _MesaControllerBase, Store {
  final _$mesaModelAtom = Atom(name: '_MesaControllerBase.mesaModel');

  @override
  MesaModel get mesaModel {
    _$mesaModelAtom.context.enforceReadPolicy(_$mesaModelAtom);
    _$mesaModelAtom.reportObserved();
    return super.mesaModel;
  }

  @override
  set mesaModel(MesaModel value) {
    _$mesaModelAtom.context.conditionallyRunInAction(() {
      super.mesaModel = value;
      _$mesaModelAtom.reportChanged();
    }, _$mesaModelAtom, name: '${_$mesaModelAtom.name}_set');
  }
}
