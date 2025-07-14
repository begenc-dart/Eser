
import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:eser/src/screen/Setting/ContactScreen/repository/api/ContactApi.dart';
import 'package:eser/src/screen/Setting/ContactScreen/repository/data/ContactData.dart';
import 'package:eser/src/utils/screen_export.dart';
part 'contact_controller.g.dart';

class ContactController = _ContactControllerBase with _$ContactController;

abstract class _ContactControllerBase with Store {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController tekstController = TextEditingController();
  FocusNode nameFocus = FocusNode();
  FocusNode phoneFocus = FocusNode();
  FocusNode tekstFocus = FocusNode();
  clear(){
    nameController.clear();
    phoneController.clear();
    tekstController.clear();

  }
   ContactApi api = ContactApi();
  @action
  Future<void> contactApi(
    BuildContext context,
    GlobalKey<FormState> keys,
    VoidCallback completeCallback,
  ) async {
    if (!(keys.currentState?.validate() ?? false)) {
      Toastwidget().toastError(context, AppLocalizations.of(context)!.fullData);
      return;
    }

    final dto = ContactData(
      fullName: nameController.text,
      phone: phoneController.text,
      message: tekstController.text,
    );

    try {
      await api.contact(dto);
      // Toastwidget().toast(context, Staticstext.successfully);
      Toastwidget().toast(context,AppLocalizations.of(context)!.successSend);
      completeCallback();
    } catch (e) {
      log('Error submitting product: $e');
    }
  }
  // dispose(){
  //   nameController.dispose();
  //   nameFocus.dispose();

  // }
}