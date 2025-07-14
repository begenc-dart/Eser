import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:eser/src/core/network/states/status.dart';
import 'package:eser/src/screen/Setting/History/repository/api/HistoryApi.dart';

import 'package:eser/src/screen/Setting/History/repository/data/HistoryData.dart';
part 'history_controller.g.dart';

class HistoryController = _HistoryControllerBase with _$HistoryController;

abstract class _HistoryControllerBase with Store {
   @observable
  bool loading = false;
  @observable
  ObservableList<HistoryData> history = ObservableList.of([]);
  @observable
  Status status = Status.none;
  Historyapi api = Historyapi();
  @action
  Future<void> fetchHistory() async {
    loading = true;
    history.clear();

    try {
      status = Status.loading;

      final newItems = await api.getHistory();

      history = ObservableList.of(newItems);
      status = Status.completed;
      loading = false;
    } catch (e) {
      log(e.toString());
      status = Status.error;
      loading = false;
    } finally {
      loading = false;
    }
  }

}