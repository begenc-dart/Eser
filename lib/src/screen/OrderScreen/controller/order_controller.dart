import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:eser/src/screen/OrderScreen/repository/api/OrderApi.dart';
import 'package:eser/src/screen/OrderScreen/repository/data/OrderData.dart';
import 'package:eser/src/utils/screen_export.dart';
part 'order_controller.g.dart';

class OrderController = _OrderControllerBase with _$OrderController;

abstract class _OrderControllerBase with Store {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  FocusNode nameFocus = FocusNode();
  FocusNode phoneFocus = FocusNode();
  FocusNode noteFocus = FocusNode();

  @observable
  int indexAddress = -1;
  @action
  change_index(int index) {
    indexAddress = index;
  }

  clear() {
    nameController.clear();
    phoneController.clear();
    noteController.clear();
  }
Orderapi api = Orderapi();
  @action
  Future<void> addOrder(
    BuildContext context,
    VoidCallback completeCallback,
     GlobalKey<FormState> keys,
    int locationId,
    int card_order_id
  ) async {
   if (keys.currentState?.validate() ??false|| indexAddress !=-1) {
      var data = OrderData(
      locationId: locationId,
      name: nameController.text,
      notes: noteController.text,
      phone: phoneController.text,
    );
    try {
      log(data.toString());
      await api.postOrder(data,card_order_id).then((e) {
        Toastwidget().toast(context, AppLocalizations.of(context)!.successfullyOrder);
        // fetchAddress();
        completeCallback();
      });
    } catch (e) {
      Toastwidget().toastError(context, AppLocalizations.of(context)!.fullData);
      log('Error submitting product: $e');
    }
   }
   else{
     Toastwidget().toastError(context, AppLocalizations.of(context)!.fullData);
   }
  }
}
