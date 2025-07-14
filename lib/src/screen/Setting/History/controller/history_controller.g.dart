// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HistoryController on _HistoryControllerBase, Store {
  late final _$loadingAtom =
      Atom(name: '_HistoryControllerBase.loading', context: context);

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

  late final _$historyAtom =
      Atom(name: '_HistoryControllerBase.history', context: context);

  @override
  ObservableList<HistoryData> get history {
    _$historyAtom.reportRead();
    return super.history;
  }

  @override
  set history(ObservableList<HistoryData> value) {
    _$historyAtom.reportWrite(value, super.history, () {
      super.history = value;
    });
  }

  late final _$statusAtom =
      Atom(name: '_HistoryControllerBase.status', context: context);

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

  late final _$fetchHistoryAsyncAction =
      AsyncAction('_HistoryControllerBase.fetchHistory', context: context);

  @override
  Future<void> fetchHistory() {
    return _$fetchHistoryAsyncAction.run(() => super.fetchHistory());
  }

  @override
  String toString() {
    return '''
loading: ${loading},
history: ${history},
status: ${status}
    ''';
  }
}
