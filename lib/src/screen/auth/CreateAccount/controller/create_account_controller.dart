import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:eser/src/screen/auth/CreateAccount/repository/api/RegisterApi.dart';
import 'package:eser/src/screen/auth/CreateAccount/repository/data/RegisterData.dart';
import 'package:eser/src/utils/ToastWidget.dart';
import 'package:eser/src/utils/screen_export.dart';
import 'package:toastification/toastification.dart';
part 'create_account_controller.g.dart';

class CreateAcountController = _CreateAcountControllerBase
    with _$CreateAcountController;

abstract class _CreateAcountControllerBase with Store {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  FocusNode nameFocus = FocusNode();
  FocusNode phoneFocus = FocusNode();
  @observable
  bool check = false;
  @action
  change_check() {
    check = !check;
  }

  clear() {
    nameController.clear();
    phoneController.clear();
  }

  dispose() {
    nameController.dispose();
    phoneController.dispose();
    nameFocus.dispose();
    phoneFocus.dispose();
  }

  Registerapi _registerapi = Registerapi();
  @action
  void registerApi(
    BuildContext context,
    GlobalKey<FormState> keys,
    VoidCallback completeCallback,
  ) {
    if (keys.currentState?.validate() ?? false) {
      final dto = RegisterData(
        phone: phoneController.text,
        full_name: nameController.text,
      );
      try {
        ObservableFuture(_registerapi.register(dto))
            .then((value) async {
              ObservableMap.of(value);

              completeCallback();
            })
            .catchError((e) {
              Toastwidget().toast(
                context,
                AppLocalizations.of(context)!.fullData,
              );
            });
      } catch (e) {
        log(e.toString());
      }
    }
  }
}
