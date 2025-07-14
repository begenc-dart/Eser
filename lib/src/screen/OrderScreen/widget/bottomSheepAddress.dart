
import 'package:eser/src/utils/screen_export.dart';

class Bottomsheepaddress {
  var controller = GetIt.instance<OrderController>();
  var addresscontroller = GetIt.instance<AddressController>();
  address(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      context: context,
      builder: (context) {
        return SizedBox(
          width: double.infinity,
          child: Wrap(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Text(
                    AppLocalizations.of(context)!.selectAddres,
                    style: Theme.of(context).textTheme.labelMedium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 15),
                  for (int i = 0; i < addresscontroller.address.length; i++)
                    Observer(
                      builder: (_) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 50,
                                child: Radio(
                                  activeColor:
                                      Theme.of(context).colorScheme.secondary,
                                  value: i,
                                  groupValue: controller.indexAddress,
                                  onChanged: (value) {
                                    controller.change_index(value!);
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    controller.change_index(i);
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 16),
                                    // width: double.infinity,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color:
                                            i == controller.indexAddress
                                                ? Theme.of(
                                                  context,
                                                ).colorScheme.secondary
                                                : Theme.of(context)
                                                    .colorScheme
                                                    .surfaceContainerLow,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(width: 15),
                                        SvgPicture.asset(
                                          Staticsimage.location,
                                          color:
                                              i == controller.indexAddress
                                                  ? Theme.of(
                                                    context,
                                                  ).colorScheme.secondary
                                                  : Theme.of(context)
                                                      .colorScheme
                                                      .surfaceContainerLow,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          addresscontroller.address[i].locationName!,
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodyMedium!.copyWith(
                                            color:
                                                i == controller.indexAddress
                                                    ? Theme.of(
                                                      context,
                                                    ).colorScheme.secondary
                                                    : Theme.of(context)
                                                        .colorScheme
                                                        .surfaceContainerLow,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Savebutton(
                      onTapCancel: () {
                          Addaddressbottomsheep().addAddress(
            context: context,
            onTapCancel: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            onTapConform: () {
              addresscontroller.addAddress(context, () {
                addresscontroller.clearAddress();
                Navigator.pop(context);
              });
            },
          ); },
                      onTapConform: () {},
                      titleCancel: AppLocalizations.of(context)!.addAdress + " +",
                      titleConform: AppLocalizations.of(context)!.save,
                      isColorless: false,
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
