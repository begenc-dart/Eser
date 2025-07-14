import 'package:eser/src/utils/screen_export.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Addressscreen extends StatelessWidget {
  Addressscreen({super.key});

  var controller = GetIt.instance<AddressController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.address,
          style: Theme.of(
            context,
          ).textTheme.labelMedium!.copyWith(fontSize: 18),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: Containerbutton(
        onTap: () {
          Addaddressbottomsheep().addAddress(
            context: context,
            onTapCancel: () {
              Navigator.pop(context);
            },
            onTapConform: () {
              controller.addAddress(context, () {
                controller.clearAddress();
                Navigator.pop(context);
              });
            },
          );
        },
        title: AppLocalizations.of(context)!.addAdress,
      ),
      body: Observer(
        builder: (_) {
          return Skeletonizer(
            enableSwitchAnimation: true,
            enabled: controller.loading,
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimary,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.address[index].locationName!,
                                  style: Theme.of(context).textTheme.bodyMedium!
                                      .copyWith(fontSize: 18),
                                ),
                                Popupmenuaddress(
                                  id: controller.address[index].id.toString(),
                                  index: index,
                                  onSelected: (String result) {
                                    if (result == "Delete") {
                                      Deleteaddressbottomsheep().deletAddress(
                                        context,
                                        controller.address[index].id.toString(),
                                        index,
                                      );
                                    } else {
                                      controller.initUpdate(
                                        controller
                                            .address[index]
                                            .locationAddress!,
                                        controller.address[index].locationName!,
                                      );
                                      Addaddressbottomsheep().addAddress(
                                        context: context,
                                        onTapCancel: () {
                                          Navigator.pop(context);
                                        },
                                        onTapConform: () {
                                          controller.putAddress(context, (){
                                            controller.clearAddress();
                                            Navigator.pop(context);
                                          }, controller.address[index].id.toString());
                                        },
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color:
                                Theme.of(
                                  context,
                                ).colorScheme.surfaceContainerLow,
                          ),
                        ],
                      ),
                    ),

                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimary,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            SvgPicture.asset(Staticsimage.location),
                            SizedBox(width: 10),
                            Text(
                              controller.address[index].locationAddress!,
                              style: Theme.of(
                                context,
                              ).textTheme.labelSmall!.copyWith(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
              itemCount: controller.address.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 16);
              },
            ),
          );
        },
      ),
    );
  }
}
