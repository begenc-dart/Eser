import 'package:eser/src/utils/screen_export.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Productscreen extends StatefulWidget {
  Productmodel model;
  Productscreen({required this.model});

  @override
  State<Productscreen> createState() => _ProductscreenState();
}

class _ProductscreenState extends State<Productscreen> {
  final RefreshController _refreshController = RefreshController();
  @override
  void initState() {
    // TODO: implement initState
    controller.fetchDiscountProducts(true, widget.model.url);
    super.initState();
  }

  var controller = GetIt.instance<DashboardController>();
  var favorite_controller = GetIt.instance<FavourityController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.model.title,
          style: Theme.of(
            context,
          ).textTheme.labelMedium!.copyWith(fontSize: 18),
        ),
      ),
      body: Observer(
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SmartRefresher(
              controller: _refreshController,
              enablePullUp: controller.hasMore,
              onRefresh: () async {
                await controller.fetchDiscountProducts(true, widget.model.url);
                _refreshController.refreshCompleted();
                if (!controller.hasMore) {
                  _refreshController.loadNoData();
                }
              },
              onLoading: () async {
                await controller.fetchDiscountProducts(false, widget.model.url);
                if (!controller.hasMore) {
                  _refreshController.loadNoData();
                } else {
                  _refreshController.loadComplete();
                }
              },
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  return Productwidget(
                    product: controller.searchProduct[index],
                    ontap: () {
                      Navigator.pushNamed(
                        context,
                        RouteContstants.productDetailsRoute,
                        arguments: controller.searchProduct[index].id,
                      );
                    },
                    isFavourity: controller.searchProduct[index].isFavorite!,
                    favourityOnTap: () {
                      controller.searchProduct[index].isFavorite =
                          !controller.searchProduct[index].isFavorite!;
                      favorite_controller.favourityData(
                        context,
                        () {},
                        FavourityData(
                          productId: controller.searchProduct[index].id,
                        ),
                      );
                      favorite_controller.fetchFavourity();
                    },
                  );
                },
                itemCount: controller.searchProduct.length,
              ),
            ),
          );
        },
      ),
    );
  }
}
