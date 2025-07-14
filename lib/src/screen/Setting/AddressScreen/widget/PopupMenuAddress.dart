import 'package:eser/src/screen/Setting/AddressScreen/controller/address_controller.dart';
import 'package:eser/src/utils/screen_export.dart';

class Popupmenuaddress extends StatelessWidget {
  String id;
  int index;
  PopupMenuItemSelected<String> onSelected;
   Popupmenuaddress({required this.id,required this.index,required this.onSelected});
  var controller = GetIt.instance<AddressController>();
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      padding: EdgeInsets.zero,
      color: Theme.of(context).colorScheme.onPrimary,
      onSelected:onSelected,
      itemBuilder:
          (BuildContext context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
              value: 'Edit',
              child: Row(
                children: [
                  SvgPicture.asset(Staticsimage.edit),
                  SizedBox(width: 10),
                  Text(
                    AppLocalizations.of(context)!.edit,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ),
            PopupMenuItem<String>(
              value: 'Delete',
              child: Row(
                children: [
                  SvgPicture.asset(Staticsimage.delte),
                  SizedBox(width: 10),
                  Text(
                    AppLocalizations.of(context)!.delete,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onError,
                    ),
                  ),
                ],
              ),
            ),
          ],
    );
  }
}
