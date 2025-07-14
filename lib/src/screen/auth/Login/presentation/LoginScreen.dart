import 'package:flutter/material.dart';
import 'package:eser/src/screen/auth/Login/controller/login_controller.dart';
import 'package:eser/src/utils/screen_export.dart';

class Loginscreen extends StatelessWidget {
  Loginscreen({super.key});
  var controller = GetIt.instance<LoginController>();
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        extendBody: true,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_rounded,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    AppLocalizations.of(context)!.loginText,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    AppLocalizations.of(context)!.loginDesc,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 43),

                      Texteditwidget(
                        type: TextInputType.phone,
                        prefixText: "+993",
                        controller: controller.phoneController,
                        validation: (value) {
                          return Validation().valigatePhone(context, value!);
                        },
                        focus: controller.phoneFocus,
                        onTapOutside: (context) {
                          controller.phoneFocus.unfocus();
                        },
                        hintText: AppLocalizations.of(context)!.phone,
                      ),
                      SizedBox(height: 15),
                      Containerbutton(
                        onTap: () {
                          controller.loginApi(context, _formKey, () {
                            Navigator.pushNamed(
                              context,
                              RouteContstants.verificationScreen,
                              arguments: controller.phoneController.text,
                            );
                          });
                        },
                        title: AppLocalizations.of(context)!.next,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
