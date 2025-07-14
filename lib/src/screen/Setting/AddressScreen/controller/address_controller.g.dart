// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddressController on _AddressControllerBase, Store {
  late final _$loadingAtom =
      Atom(name: '_AddressControllerBase.loading', context: context);

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

  late final _$addressAtom =
      Atom(name: '_AddressControllerBase.address', context: context);

  @override
  ObservableList<AddressGetData> get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(ObservableList<AddressGetData> value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  late final _$statusAtom =
      Atom(name: '_AddressControllerBase.status', context: context);

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

  late final _$addAddressAsyncAction =
      AsyncAction('_AddressControllerBase.addAddress', context: context);

  @override
  Future<void> addAddress(BuildContext context, VoidCallback completeCallback) {
    return _$addAddressAsyncAction
        .run(() => super.addAddress(context, completeCallback));
  }

  late final _$fetchAddressAsyncAction =
      AsyncAction('_AddressControllerBase.fetchAddress', context: context);

  @override
  Future<void> fetchAddress() {
    return _$fetchAddressAsyncAction.run(() => super.fetchAddress());
  }

  late final _$deleteAddressAsyncAction =
      AsyncAction('_AddressControllerBase.deleteAddress', context: context);

  @override
  Future<dynamic> deleteAddress(BuildContext context,
      VoidCallback completeCallback, String location_id, int index) {
    return _$deleteAddressAsyncAction.run(() =>
        super.deleteAddress(context, completeCallback, location_id, index));
  }

  late final _$putAddressAsyncAction =
      AsyncAction('_AddressControllerBase.putAddress', context: context);

  @override
  Future<void> putAddress(
      BuildContext context, VoidCallback completeCallback, String id) {
    return _$putAddressAsyncAction
        .run(() => super.putAddress(context, completeCallback, id));
  }

  late final _$_AddressControllerBaseActionController =
      ActionController(name: '_AddressControllerBase', context: context);

  @override
  dynamic initUpdate(String address, String addressName) {
    final _$actionInfo = _$_AddressControllerBaseActionController.startAction(
        name: '_AddressControllerBase.initUpdate');
    try {
      return super.initUpdate(address, addressName);
    } finally {
      _$_AddressControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
address: ${address},
status: ${status}
    ''';
  }
}
