import 'package:eser/src/screen/Setting/AddressScreen/controller/address_controller.dart';
import 'package:eser/src/utils/screen_export.dart';

class Addaddressbottomsheep {
  var controller = GetIt.instance<AddressController>();
  addAddress({required BuildContext context,required VoidCallback onTapCancel,required VoidCallback onTapConform}) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom:
                MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
          ),
          child: SingleChildScrollView(
            child: Wrap(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
                    child: Column(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.addAddress,
                          style: Theme.of(
                            context,
                          ).textTheme.labelMedium!.copyWith(fontSize: 24),
                        ),
                        SizedBox(height: 10),
                        Texteditwidget(
                          fieldPadding: EdgeInsets.zero,
                          controller: controller.addressNameController,
                          validation: (value) {
                            return Validation().validateAddressName(
                              context,
                              value!,
                            );
                          },
                          focus: controller.addressNameFocus,
                          onTapOutside: (context) {
                            controller.addressNameFocus.unfocus();
                          },
                          hintText: AppLocalizations.of(context)!.addressName,
                        ),
                        SizedBox(height: 16),
                        Texteditwidget(
                          fieldPadding: EdgeInsets.zero,
                          controller: controller.addressController,
                          validation: (value) {
                            return Validation().validateAddress(
                              context,
                              value!,
                            );
                          },
                          focus: controller.addressFocus,
                          onTapOutside: (context) {
                            controller.addressFocus.unfocus();
                          },
                          hintText: AppLocalizations.of(context)!.addressFull,
                        ),
                        SizedBox(height: 30),
                        Savebutton(
                          onTapCancel: onTapCancel,
                          isColorless: true,
                          onTapConform: onTapConform,
                          titleCancel: AppLocalizations.of(context)!.cancel,
                          titleConform: AppLocalizations.of(context)!.save,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
