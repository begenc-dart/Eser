import 'dart:developer';

import 'package:eser/src/screen/DashboardScreen/controller/banner_controller.dart';
import 'package:eser/src/screen/FavourityScreen/controller/favourity_controller.dart';
import 'package:eser/src/screen/ProductScreen/model/ProductModel.dart';
import 'package:eser/src/screen/Shopping/model/MarketModel.dart';
import 'package:eser/src/utils/screen_export.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Dashboardscreen extends StatefulWidget {
  Dashboardscreen({super.key});

  @override
  State<Dashboardscreen> createState() => _DashboardscreenState();
}

class _DashboardscreenState extends State<Dashboardscreen>
    with AutomaticKeepAliveClientMixin {
  final RefreshController _refreshController = RefreshController();
  var language_controller= GetIt.instance<LangugaeController>();
  var controller = GetIt.instance<DashboardController>();
  var marketController = GetIt.instance<CategoriesController>();
  var favourityController = GetIt.instance<FavourityController>();
  var banner_controller = GetIt.instance<BannerController>();
  @override
  void initState() {
    // TODO: implement initState
    controller.fetchProducts(true);
    banner_controller.fetchBanner();
    marketController.fetchNewMarket("?is_new=true");
    marketController.fetchVip("?is_vip=true");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: Observer(
        builder: (_) {
          return SmartRefresher(
            enablePullUp: controller.hasMore,
            onRefresh: () async {
              await controller.fetchProducts(true);
              _refreshController.refreshCompleted();
              if (!controller.hasMore) {
                _refreshController.loadNoData();
              }
            },
            onLoading: () async {
              await controller.fetchProducts(false);
              if (!controller.hasMore) {
                _refreshController.loadNoData();
              } else {
                _refreshController.loadComplete();
              }
            },
            controller: _refreshController,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: Searchwidget()),
                SliverToBoxAdapter(child: Caruselimage()),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Discountcard(
                          title: AppLocalizations.of(context)!.sale,
                          image: Staticsimage.discount,
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RouteContstants.productScreen,
                              arguments: Productmodel(
                                title: AppLocalizations.of(context)!.sale,
                                url: "has_discount=true",
                              ),
                            );
                          },
                        ),
                        SizedBox(width: 10),
                        Discountcard(
                          title: AppLocalizations.of(context)!.topSale,
                          image: Staticsimage.topsale,
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RouteContstants.productScreen,
                              arguments: Productmodel(
                                title: AppLocalizations.of(context)!.topSale,
                                url: "is_new=true",
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Observer(
                    builder: (_) {
                      return Skeletonizer(
                        enableSwitchAnimation: true,
                        enabled: marketController.loading,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.newShopping,
                                style: Theme.of(context).textTheme.labelMedium!
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 10),
                              SizedBox(
                                width: double.infinity,
                                height: 110,
                                child: Observer(
                                  builder: (_) {
                                    return ListView.separated(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        log(
                                          marketController.newMarket.length
                                              .toString(),
                                        );
                                        return Shoppinggrid(
                                          market:
                                              marketController.newMarket[index],
                                          isNew: true,
                                          onTap: () {
                                            Navigator.pushNamed(
                                              context,
                                              RouteContstants.shopping,
                                              arguments: Marketmodel(
                                                id:
                                                    marketController
                                                        .newMarket[index]
                                                        .id!,
                                                title:
                                                    language_controller.currentLocale==Locale("tk")?  marketController
                                                        .markets[index]
                                                        .name!:marketController
                                                        .markets[index]
                                                        .nameRu!,
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      separatorBuilder: (
                                        BuildContext context,
                                        int index,
                                      ) {
                                        return SizedBox(width: 10);
                                      },
                                      itemCount:
                                          marketController.newMarket.length,
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: Observer(
                    builder: (_) {
                      return Skeletonizer(
                        enableSwitchAnimation: true,
                        enabled: marketController.loading,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.vipShopping,
                                style: Theme.of(context).textTheme.labelMedium!
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 10),
                              SizedBox(
                                width: double.infinity,
                                height: 110,
                                child: Observer(
                                  builder: (_) {
                                    return ListView.separated(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Shoppinggrid(
                                          market:
                                              marketController.markets[index],
                                          isVip: true,
                                          onTap: () {
                                            Navigator.pushNamed(
                                              context,
                                              RouteContstants.shopping,
                                              arguments: Marketmodel(
                                                id:
                                                    marketController
                                                        .markets[index]
                                                        .id!,
                                                title:
                                                  language_controller.currentLocale==Locale("tk")?  marketController
                                                        .markets[index]
                                                        .name!:marketController
                                                        .markets[index]
                                                        .nameRu!,
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      separatorBuilder: (
                                        BuildContext context,
                                        int index,
                                      ) {
                                        return SizedBox(width: 10);
                                      },
                                      itemCount:
                                          marketController.markets.length,
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  sliver: SliverGrid.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                    ),
                    itemBuilder: (context, index) {
                      return Observer(
                        builder: (_) {
                          return Productwidget(
                            ontap: () {
                              Navigator.pushNamed(
                                context,
                                RouteContstants.productDetailsRoute,
                                arguments: controller.product[index].id,
                              );
                            },
                            product: controller.product[index],
                            isFavourity: controller.product[index].isFavorite!,
                            favourityOnTap: () {
                              controller.product[index].isFavorite =
                                  !controller.product[index].isFavorite!;

                              favourityController.favourityData(
                                context,
                                () {},
                                FavourityData(
                                  productId: controller.product[index].id,
                                ),
                              );
                              favourityController.fetchFavourity();
                            },
                          );
                        },
                      );
                    },
                    itemCount: controller.product.length,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
