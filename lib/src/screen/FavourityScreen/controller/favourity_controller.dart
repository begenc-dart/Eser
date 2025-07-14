import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:eser/src/core/network/states/status.dart';

import 'package:eser/src/utils/screen_export.dart';
part 'favourity_controller.g.dart';

class FavourityController = _FavourityControllerBase with _$FavourityController;

abstract class _FavourityControllerBase with Store {
  FavourityApi api = FavourityApi();

  @action
  Future<void> favourityData(
    BuildContext context,
    VoidCallback completeCallback,
    FavourityData data,
  ) async {
    try {
      log(data.toString());
      await api.favourity(data).then((e) {
        // Toastwidget().toast(context, AppLocalizations.of(context)!.cardadd);
        completeCallback();
      });
    } catch (e) {
      log('Error submitting product: $e');
    }
  }

  @observable
  ObservableList<ProductData> favourity = ObservableList.of([]);
  @observable
  bool loading = false;
  @observable
  Status status = Status.none;

  @action
  Future<bool> fetchFavourity() async {
    try {
      loading = true;
      status = Status.loading;
      final result = await api.getFavourityProduct();
      favourity.clear();
      favourity = ObservableList.of(result);
      status = Status.completed;
      loading = false;
      return true;
    } catch (e) {
      status = Status.error;
        loading = false;
      return false;
    }
  }
}
