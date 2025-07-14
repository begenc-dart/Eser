import 'package:eser/src/screen/ProductScreen/model/ProductModel.dart';
import 'package:eser/src/screen/Shopping/model/MarketModel.dart';
import 'package:eser/src/utils/screen_export.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Categoriesscreen extends StatefulWidget {
  Categoriesscreen({super.key});

  @override
  State<Categoriesscreen> createState() => _CategoriesscreenState();
}

class _CategoriesscreenState extends State<Categoriesscreen>
    with AutomaticKeepAliveClientMixin {
  final RefreshController _refreshController = RefreshController();
  var marketController = GetIt.instance<CategoriesController>();
  @override
  void initState() {
    // TODO: implement initState
    marketController.fetchNewMarket("");
    marketController.fetchCategory(true);
    super.initState();
  }

  var language_controller = GetIt.instance<LangugaeController>();
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.category,
          style: Theme.of(
            context,
          ).textTheme.labelMedium!.copyWith(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 16),
            height: 55,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Observer(
              builder: (_) {
                return Row(
                  children: [
                    Selectedtype(
                      isCategories: marketController.isCategories,
                      onTap: () {
                        marketController.changeType();
                      },
                      title: AppLocalizations.of(context)!.categories,
                    ),

                    Selectedtype(
                      isCategories: !marketController.isCategories,
                      onTap: () {
                        marketController.changeType();
                      },
                      title: AppLocalizations.of(context)!.shopping,
                    ),
                  ],
                );
              },
            ),
          ),
          Observer(
            builder: (_) {
              return Expanded(
                child:
                    marketController.isCategories
                        ? SmartRefresher(
                          enablePullUp: marketController.hasMore,
                          onRefresh: () async {
                            await marketController.fetchCategory(true);
                            _refreshController.refreshCompleted();
                            if (!marketController.hasMore) {
                              _refreshController.loadNoData();
                            }
                          },
                          onLoading: () async {
                            await marketController.fetchCategory(false);
                            if (!marketController.hasMore) {
                              _refreshController.loadNoData();
                            } else {
                              _refreshController.loadComplete();
                            }
                          },
                          controller: _refreshController,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    crossAxisCount: 2,
                                  ),
                              itemBuilder: (context, index) {
                                return Categoriesgrid(
                                  category: marketController.category[index],
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      RouteContstants.productScreen,
                                      arguments: Productmodel(
                                        title:
                                            language_controller.currentLocale ==
                                                    Locale("tk")
                                                ? marketController
                                                    .category[index]
                                                    .name!
                                                : marketController
                                                    .category[index]
                                                    .nameRu!,
                                        url:
                                            "category_id=${marketController.category[index].id}",
                                      ),
                                    );
                                  },
                                );
                              },
                              itemCount: marketController.category.length,
                            ),
                          ),
                        )
                        : Observer(
                          builder: (_) {
                            return Skeletonizer(
                              enableSwitchAnimation: true,
                              enabled: marketController.loading,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 10,
                                ),
                                child: GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4,
                                        childAspectRatio: 0.9,
                                        mainAxisSpacing: 5,
                                        crossAxisSpacing: 5,
                                      ),
                                  itemBuilder: (context, index) {
                                    return Shoppinggrid(
                                      market: marketController.newMarket[index],
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
                                                language_controller
                                                            .currentLocale ==
                                                        Locale("tk")
                                                    ? marketController
                                                        .newMarket[index]
                                                        .name!
                                                    : marketController
                                                        .newMarket[index]
                                                        .nameRu!,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  itemCount: marketController.newMarket.length,
                                ),
                              ),
                            );
                          },
                        ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
