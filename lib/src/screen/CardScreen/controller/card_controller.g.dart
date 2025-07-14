// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CardController on _CardControllerBase, Store {
  late final _$loadingAtom =
      Atom(name: '_CardControllerBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$cardAtom =
      Atom(name: '_CardControllerBase.card', context: context);

  @override
  ObservableList<CardGetData> get card {
    _$cardAtom.reportRead();
    return super.card;
  }

  @override
  set card(ObservableList<CardGetData> value) {
    _$cardAtom.reportWrite(value, super.card, () {
      super.card = value;
    });
  }

  late final _$statusAtom =
      Atom(name: '_CardControllerBase.status', context: context);

  @override
  Status get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(Status value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$sumAtom =
      Atom(name: '_CardControllerBase.sum', context: context);

  @override
  int get sum {
    _$sumAtom.reportRead();
    return super.sum;
  }

  @override
  set sum(int value) {
    _$sumAtom.reportWrite(value, super.sum, () {
      super.sum = value;
    });
  }

  late final _$addCardProductAsyncAction =
      AsyncAction('_CardControllerBase.addCardProduct', context: context);

  @override
  Future<void> addCardProduct(
      BuildContext context, VoidCallback completeCallback, CardDataPost data) {
    return _$addCardProductAsyncAction
        .run(() => super.addCardProduct(context, completeCallback, data));
  }

  late final _$fetchCardAsyncAction =
      AsyncAction('_CardControllerBase.fetchCard', context: context);

  @override
  Future<void> fetchCard() {
    return _$fetchCardAsyncAction.run(() => super.fetchCard());
  }

  late final _$deleteProductCartAsyncAction =
      AsyncAction('_CardControllerBase.deleteProductCart', context: context);

  @override
  Future<dynamic> deleteProductCart(int index, int indexShop) {
    return _$deleteProductCartAsyncAction
        .run(() => super.deleteProductCart(index, indexShop));
  }

  late final _$_CardControllerBaseActionController =
      ActionController(name: '_CardControllerBase', context: context);

  @override
  dynamic cleanList() {
    final _$actionInfo = _$_CardControllerBaseActionController.startAction(
        name: '_CardControllerBase.cleanList');
    try {
      return super.cleanList();
    } finally {
      _$_CardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
card: ${card},
status: ${status},
sum: ${sum}
    ''';
  }
}
