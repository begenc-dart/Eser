import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:eser/src/screen/auth/Login/repository/api/LoginApi.dart';
import 'package:eser/src/screen/auth/Login/repository/data/LoginData.dart';
import 'package:eser/src/utils/ToastWidget.dart';
import 'package:eser/src/utils/screen_export.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  TextEditingController phoneController = TextEditingController();
  FocusNode phoneFocus = FocusNode();
  clear() {
    phoneController.clear();
  }

  LoginApi login = LoginApi();
  @action
  void loginApi(
    BuildContext context,
    GlobalKey<FormState> keys,
    VoidCallback completeCallback,
  ) {
    if (keys.currentState?.validate() ?? false) {
      final dto = Logindata(phone: phoneController.text);
      try {
        ObservableFuture(login.login(dto))
            .then((value) async {
              ObservableMap.of(value);

              completeCallback();
            })
            .catchError((e) {
              log(e.toString());
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
