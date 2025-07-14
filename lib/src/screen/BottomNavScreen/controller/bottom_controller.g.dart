// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BottomController on _BottomControllerBase, Store {
  late final _$indexAtom =
      Atom(name: '_BottomControllerBase.index', context: context);

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  late final _$_BottomControllerBaseActionController =
      ActionController(name: '_BottomControllerBase', context: context);

  @override
  dynamic changeIndex(int realIndex) {
    final _$actionInfo = _$_BottomControllerBaseActionController.startAction(
        name: '_BottomControllerBase.changeIndex');
    try {
      return super.changeIndex(realIndex);
    } finally {
      _$_BottomControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
index: ${index}
    ''';
  }
}
