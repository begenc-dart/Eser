// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourity_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavourityController on _FavourityControllerBase, Store {
  late final _$favourityAtom =
      Atom(name: '_FavourityControllerBase.favourity', context: context);

  @override
  ObservableList<ProductData> get favourity {
    _$favourityAtom.reportRead();
    return super.favourity;
  }

  @override
  set favourity(ObservableList<ProductData> value) {
    _$favourityAtom.reportWrite(value, super.favourity, () {
      super.favourity = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_FavourityControllerBase.loading', context: context);

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

  late final _$statusAtom =
      Atom(name: '_FavourityControllerBase.status', context: context);

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

  late final _$favourityDataAsyncAction =
      AsyncAction('_FavourityControllerBase.favourityData', context: context);

  @override
  Future<void> favourityData(
      BuildContext context, VoidCallback completeCallback, FavourityData data) {
    return _$favourityDataAsyncAction
        .run(() => super.favourityData(context, completeCallback, data));
  }

  late final _$fetchFavourityAsyncAction =
      AsyncAction('_FavourityControllerBase.fetchFavourity', context: context);

  @override
  Future<bool> fetchFavourity() {
    return _$fetchFavourityAsyncAction.run(() => super.fetchFavourity());
  }

  @override
  String toString() {
    return '''
favourity: ${favourity},
loading: ${loading},
status: ${status}
    ''';
  }
}
