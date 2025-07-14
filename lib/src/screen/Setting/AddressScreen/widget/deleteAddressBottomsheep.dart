import 'package:eser/src/screen/Setting/AddressScreen/controller/address_controller.dart';
import 'package:eser/src/utils/screen_export.dart';

class Deleteaddressbottomsheep {
  var controller = GetIt.instance<AddressController>();
  deletAddress(BuildContext context, String id, int index) {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    AppLocalizations.of(context)!.deleteAddress,
                    style: Theme.of(
                      context,
                    ).textTheme.labelMedium!.copyWith(fontSize: 24),
                  ),

                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Savebutton(
                      onTapCancel: () {
                        Navigator.pop(context);
                      },
                      isColorless: true,
                      onTapConform: () {
                        controller.deleteAddress(context, () {
                          Navigator.pop(context);
                        }, id,index);
                      },
                      titleCancel: AppLocalizations.of(context)!.no,
                      titleConform: AppLocalizations.of(context)!.yes,
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
