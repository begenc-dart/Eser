// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrderController on _OrderControllerBase, Store {
  late final _$indexAddressAtom =
      Atom(name: '_OrderControllerBase.indexAddress', context: context);

  @override
  int get indexAddress {
    _$indexAddressAtom.reportRead();
    return super.indexAddress;
  }

  @override
  set indexAddress(int value) {
    _$indexAddressAtom.reportWrite(value, super.indexAddress, () {
      super.indexAddress = value;
    });
  }

  late final _$addOrderAsyncAction =
      AsyncAction('_OrderControllerBase.addOrder', context: context);

  @override
  Future<void> addOrder(BuildContext context, VoidCallback completeCallback,
      GlobalKey<FormState> keys, int locationId, int card_order_id) {
    return _$addOrderAsyncAction.run(() => super
        .addOrder(context, completeCallback, keys, locationId, card_order_id));
  }

  late final _$_OrderControllerBaseActionController =
      ActionController(name: '_OrderControllerBase', context: context);

  @override
  dynamic change_index(int index) {
    final _$actionInfo = _$_OrderControllerBaseActionController.startAction(
        name: '_OrderControllerBase.change_index');
    try {
      return super.change_index(index);
    } finally {
      _$_OrderControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
indexAddress: ${indexAddress}
    ''';
  }
}
