import 'package:eser/src/utils/screen_export.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Shoppingscreen extends StatefulWidget {
  Marketmodel market;
  Shoppingscreen({required this.market});

  @override
  State<Shoppingscreen> createState() => _ShoppingscreenState();
}

class _ShoppingscreenState extends State<Shoppingscreen>
    with AutomaticKeepAliveClientMixin {
  var controller = GetIt.instance<MarketProductController>();
  var favourity_controller = GetIt.instance<FavourityController>();
  @override
  void initState() {
    // TODO: implement initState
    controller.fetchProduct(true, widget.market.id);
    super.initState();
  }

  final RefreshController _refreshController = RefreshController();
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.market.title,
          style: Theme.of(
            context,
          ).textTheme.labelMedium!.copyWith(fontSize: 20),
        ),
        centerTitle: true,
        actions: [
          // InkWell(
          //   onTap: () {
          //     Navigator.pushNamed(context, RouteContstants.filterScreenRoute);
          //   },
          //   child: SvgPicture.asset(Staticsimage.filter),
          // ),
          // SizedBox(width: 16),
        ],
      ),
      body: Observer(
        builder: (_) {
          return SmartRefresher(
            enablePullUp: controller.hasMore,
            onRefresh: () async {
              await controller.fetchProduct(true, widget.market.id);
              _refreshController.refreshCompleted();
              if (!controller.hasMore) {
                _refreshController.loadNoData();
              }
            },
            onLoading: () async {
              await controller.fetchProduct(false, widget.market.id);
              if (!controller.hasMore) {
                _refreshController.loadNoData();
              } else {
                _refreshController.loadComplete();
              }
            },
            controller: _refreshController,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child:
                      controller.markets == null
                          ? Container()
                          : Storyinformationwidget(market: controller.markets),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  sliver: SliverGrid.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                    ),
                    itemBuilder: (context, index) {
                      return Productwidget(
                        product: controller.market[index],
                        ontap: () {
                          Navigator.pushNamed(
                            context,
                            RouteContstants.productDetailsRoute,
                            arguments: controller.market[index].id,
                          );
                        },
                        isFavourity: controller.market[index].isFavorite!,
                        favourityOnTap: () {
                          controller.market[index].isFavorite =
                              !controller.market[index].isFavorite!;
                          favourity_controller.favourityData(
                            context,
                            () {},
                            FavourityData(
                              productId: controller.market[index].id,
                            ),
                          );
                          favourity_controller.fetchFavourity();
                        },
                      );
                    },
                    itemCount: controller.market.length,
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
