import 'package:eser/src/screen/CardScreen/controller/card_controller.dart';
import 'package:eser/src/screen/CardScreen/repository/api/CardApi.dart';
import 'package:eser/src/screen/CardScreen/repository/data/CardAddData.dart';
import 'package:eser/src/screen/OrderScreen/model/OrderModel.dart';

import 'package:eser/src/utils/screen_export.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Cardscreen extends StatefulWidget {
  Cardscreen({super.key});

  @override
  State<Cardscreen> createState() => _CardscreenState();
}

class _CardscreenState extends State<Cardscreen> {
  var controller = GetIt.instance<CardController>();
  @override
  void initState() {
    // TODO: implement initState
    controller.fetchCard();
    super.initState();
  }
var controller_language = GetIt.instance<LangugaeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.card,
          style: Theme.of(
            context,
          ).textTheme.labelMedium!.copyWith(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Observer(
        builder: (_) {
          return Skeletonizer(
            enableSwitchAnimation: true,
            enabled: controller.loading,
            child: ListView.separated(
              itemBuilder: (context, index) {
                var market = controller.card[index];
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimary,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                controller_language.currentLocale==Locale("tk")?  market.marketName!:market.marketNameRu!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(fontSize: 20),
                                ),
                                // IconButton(
                                //   onPressed: () {
                                //     showModalBottomSheet(
                                //       backgroundColor: Theme.of(context).colorScheme.onSecondary,
                                //       context: context,
                                //       builder: (context) {
                                //         return Wrap(
                                //           children: [
                                //             Column(
                                //               children: [
                                //                 Text(
                                //                   AppLocalizations.of(context)!.storyInformation,
                                //                   style: Theme.of(context)
                                //                       .textTheme
                                //                       .labelMedium!
                                //                       .copyWith(fontSize: 20),
                                //                 ),
                                //                 SizedBox(height: 16,),
                                //               Storyinformationwidget(market: Market(id: id, phone: phone, deliveryPrice: deliveryPrice, name: name, nameRu: nameRu, location: location, locationRu: locationRu, thumbnailUrl: thumbnailUrl, isNew: isNew, isVip: isVip),),
                                //               SizedBox(height: 16,)
                                //               ],
                                //             ),
                                //           ],
                                //         );
                                //       },
                                //     );
                                //   },
                                //   icon: Icon(
                                //     Icons.info_outline,
                                //     color: Theme.of(context).colorScheme.primary,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          Divider(
                            color:
                                Theme.of(
                                  context,
                                ).colorScheme.surfaceContainerLow,
                            indent: 0,
                            endIndent: 0,
                          ),
                        ],
                      ),
                    ),

                    Container(
                      // padding: EdgeInsets.only(left: 10,right: 10),
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimary,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        // border: Border.all(
                        //   color: Theme.of(context).colorScheme.surfaceContainerLow,
                        // ),
                      ),
                      child: Observer(
                        builder: (_) {
                          var market = controller.card[index];
                          return Column(
                            children: [
                              for (int i = 0; i < market.products.length; i++)
                                Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Productcardwidget(
                                    product: market.products[i],
                                    onTapAdd: () {
                                      market.products[i].count =
                                          market.products[i].count! + 1;
                                      market.sum +=
                                          market.products[i].sizePrice!
                                              .toDouble();
                                      CardApi().cardUpdate(
                                        CardPutData(
                                          countChange: market.products[i].count,
                                          sized_id:
                                              market.products[i].sizeId!
                                                  .toInt(),
                                        ),
                                      );
                                    },
                                    onTapRemove: () {
                                      if (market.products[i].count! > 1) {
                                        market.products[i].count =
                                            market.products[i].count! - 1;
                                        market.sum -=
                                            market.products[i].sizePrice!
                                                .toDouble();
                                        CardApi().cardUpdate(
                                          CardPutData(
                                            countChange:
                                                market.products[i].count,
                                            sized_id:
                                                market.products[i].sizeId!
                                                    .toInt(),
                                          ),
                                        );
                                      }
                                    },
                                    onTapDelete: () {
                                      controller.deleteProductCart(i, index);
                                    },
                                  ),
                                ),
                              Padding(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: Pricestaticswidget(product: market),
                              ),
                              Containerbutton(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    RouteContstants.orderScreenRoute,
                                    arguments:Ordermodel(card_order_id:  market.cartId!, sum: (market.sum+market.deliveryPrice!).toStringAsFixed(1))
                                  );
                                },
                                title: AppLocalizations.of(context)!.next,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
              itemCount: controller.card.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 10);
              },
            ),
          );
        },
      ),
    );
  }
}
