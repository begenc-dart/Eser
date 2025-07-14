import 'package:flutter/material.dart';
import 'package:eser/src/utils/screen_export.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Searchresult extends StatefulWidget {
  String query;
  DashboardController controller;
  Searchresult({required this.controller,required this.query});

  @override
  State<Searchresult> createState() => _SearchresultState();
}

class _SearchresultState extends State<Searchresult> {
  final RefreshController _refreshController = RefreshController();
  @override
  void initState() {
    // TODO: implement initState
   widget. controller.fetchSearchProducts(widget.query,true);
    super.initState();
  }

  var favourity_controller =  GetIt.instance<FavourityController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SmartRefresher(
            controller: _refreshController,
            // enablePullUp: widget. controller.hasMore,
            onRefresh: () async {
              await widget. controller.fetchSearchProducts(widget.query,true);
              _refreshController.refreshCompleted();
              if (!widget. controller.hasMore) {
                _refreshController.loadNoData();
              }
            },
            onLoading: () async {
              await widget. controller.fetchSearchProducts(widget.query,false);
              if (!widget. controller.hasMore) {
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
                  product: widget. controller.searchProduct[index],
                  ontap: () {
                    Navigator.pushNamed(
                      context,
                      RouteContstants.productDetailsRoute,
                      arguments: widget. controller.searchProduct[index].id
                    );
                  },
                    isFavourity:widget. controller.searchProduct[index].isFavorite!,
                            favourityOnTap: () {
                             widget. controller.searchProduct[index].isFavorite =
                                  !widget.controller.searchProduct[index].isFavorite!;
                           favourity_controller .favourityData(
                                    context,
                                    () {},
                                    FavourityData(
                                      productId: widget.controller.searchProduct[index].id,
                                    ),
                                  );
                                  favourity_controller.fetchFavourity();
                                   },
                                
                            
                );
                
              },
              itemCount: widget. controller.searchProduct.length,
            ),
          ),
        );
      }
    );
  }
}
