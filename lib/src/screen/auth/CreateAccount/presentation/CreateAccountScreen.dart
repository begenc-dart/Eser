import 'package:eser/src/utils/screen_export.dart';

class Createaccountscreen extends StatelessWidget {
  Createaccountscreen({super.key});
  var controller = GetIt.instance<CreateAcountController>();
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
                    AppLocalizations.of(context)!.createAccount,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    AppLocalizations.of(context)!.informationAccount,
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
                        controller: controller.nameController,
                        validation: (value) {
                          return Validation().validateName(context, value!);
                        },
                        focus: controller.nameFocus,
                        onTapOutside: (context) {
                          controller.nameFocus.unfocus();
                        },
                        hintText: AppLocalizations.of(context)!.name,
                      ),
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
                      Observer(
                        builder: (_) {
                          return CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            // selectedTileColor: Theme.of(context).colorScheme.secondary,
                            contentPadding: EdgeInsets.only(
                              left: 16,
                              right: 16,
                            ),
                            title: RichText(
                              text: TextSpan(
                                text: AppLocalizations.of(context)!.terms1,
                                style: Theme.of(
                                  context,
                                ).textTheme.labelMedium!.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                                children: [
                                  TextSpan(
                                    text: AppLocalizations.of(context)!.terms2,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(fontSize: 14),
                                  ),
                                  TextSpan(
                                    text: AppLocalizations.of(context)!.terms3,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.labelMedium!.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            value: controller.check,
                            onChanged: (value) {
                              controller.change_check();
                            },
                          );
                        },
                      ),
                      SizedBox(height: 15),
                      Containerbutton(
                        onTap: () {
                          controller.registerApi(context, _formKey, () {
                            Navigator.pushNamed(
                              context,
                              RouteContstants.verificationScreen,
                              arguments: controller.phoneController.text
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
