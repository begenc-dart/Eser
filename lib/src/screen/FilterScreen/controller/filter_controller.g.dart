// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FilterController on _FilterControllerBase, Store {
  late final _$select_sortAtom =
      Atom(name: '_FilterControllerBase.select_sort', context: context);

  @override
  String get select_sort {
    _$select_sortAtom.reportRead();
    return super.select_sort;
  }

  @override
  set select_sort(String value) {
    _$select_sortAtom.reportWrite(value, super.select_sort, () {
      super.select_sort = value;
    });
  }

  late final _$_FilterControllerBaseActionController =
      ActionController(name: '_FilterControllerBase', context: context);

  @override
  dynamic change_value(String value) {
    final _$actionInfo = _$_FilterControllerBaseActionController.startAction(
        name: '_FilterControllerBase.change_value');
    try {
      return super.change_value(value);
    } finally {
      _$_FilterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
select_sort: ${select_sort}
    ''';
  }
}
