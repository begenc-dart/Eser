import 'package:eser/src/screen/CardScreen/controller/card_controller.dart';
import 'package:eser/src/screen/CardScreen/repository/api/CardApi.dart';
import 'package:eser/src/screen/OrderScreen/model/OrderModel.dart';
import 'package:eser/src/utils/screen_export.dart';

class Orderscreen extends StatelessWidget {
  Ordermodel orders;
  Orderscreen({required this.orders});
  var controller = GetIt.instance<OrderController>();
  var _key = GlobalKey<FormState>();
  var addressController = GetIt.instance<AddressController>();
  var cardController = GetIt.instance<CardController>();
  var language_controller = GetIt.instance<LangugaeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.orderConform,
          style: Theme.of(
            context,
          ).textTheme.labelMedium!.copyWith(fontSize: 20),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: Bottomnavorder(
        onTap: () {
          if (controller.indexAddress != -1) {
            controller.addOrder(
              context,
              () {
                CardApi().deleteCard(orders.card_order_id.toString());
                cardController.cleanList();
                Navigator.pop(context);
              },
              _key,
              addressController.address[controller.indexAddress].id!,
              orders.card_order_id,
            );
          } else {
            Toastwidget().toastError(
              context,
              AppLocalizations.of(context)!.selectedAddress,
            );
          }
        },
        sum: orders.sum,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Bottomsheepaddress().address(context);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.surfaceContainerLow,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          Staticsimage.location,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        SizedBox(width: 10),
                        Observer(
                          builder: (_) {
                            return Text(
                              controller.indexAddress != -1
                                  ? language_controller.currentLocale ==
                                          Locale("tk")
                                      ? addressController
                                          .address[controller.indexAddress]
                                          .locationName!
                                      : addressController
                                          .address[controller.indexAddress]
                                          .locationNameRu!
                                  : AppLocalizations.of(context)!.selectAddress,
                              style: Theme.of(context).textTheme.labelSmall,
                            );
                          },
                        ),
                      ],
                    ),
                    Icon(Icons.keyboard_arrow_down_sharp),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Form(
              key: _key,
              child: Column(
                children: [
                  Texteditwidget(
                    fieldPadding: EdgeInsets.zero,
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
                    fieldPadding: EdgeInsets.only(top: 16),
                    controller: controller.phoneController,
                    validation: (value) {
                      return Validation().valigatePhone(context, value!);
                    },
                    type: TextInputType.number,
                    prefixText: "+993",
                    focus: controller.phoneFocus,
                    onTapOutside: (context) {
                      controller.phoneFocus.unfocus();
                    },
                    hintText: AppLocalizations.of(context)!.phone,
                  ),
                  Texteditwidget(
                    fieldPadding: EdgeInsets.only(top: 16),
                    controller: controller.noteController,
                    validation: (value) {
                      return null;
                    },
                    type: TextInputType.multiline,
                    maxLines: 3,
                    focus: controller.noteFocus,
                    onTapOutside: (context) {
                      controller.noteFocus.unfocus();
                    },
                    hintText: AppLocalizations.of(context)!.note,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              AppLocalizations.of(context)!.warring,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
