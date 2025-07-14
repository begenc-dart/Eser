// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_account_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateAcountController on _CreateAcountControllerBase, Store {
  late final _$checkAtom =
      Atom(name: '_CreateAcountControllerBase.check', context: context);

  @override
  bool get check {
    _$checkAtom.reportRead();
    return super.check;
  }

  @override
  set check(bool value) {
    _$checkAtom.reportWrite(value, super.check, () {
      super.check = value;
    });
  }

  late final _$_CreateAcountControllerBaseActionController =
      ActionController(name: '_CreateAcountControllerBase', context: context);

  @override
  dynamic change_check() {
    final _$actionInfo = _$_CreateAcountControllerBaseActionController
        .startAction(name: '_CreateAcountControllerBase.change_check');
    try {
      return super.change_check();
    } finally {
      _$_CreateAcountControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void registerApi(BuildContext context, GlobalKey<FormState> keys,
      VoidCallback completeCallback) {
    final _$actionInfo = _$_CreateAcountControllerBaseActionController
        .startAction(name: '_CreateAcountControllerBase.registerApi');
    try {
      return super.registerApi(context, keys, completeCallback);
    } finally {
      _$_CreateAcountControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
check: ${check}
    ''';
  }
}
