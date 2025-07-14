import 'package:eser/src/utils/screen_export.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Productdetailsscreen extends StatefulWidget {
  int product_id;
  Productdetailsscreen({required this.product_id});

  @override
  State<Productdetailsscreen> createState() => _ProductdetailsscreenState();
}

class _ProductdetailsscreenState extends State<Productdetailsscreen> {
  var controller = GetIt.instance<DetailsController>();
  @override
  void initState() {
    // TODO: implement initState
    controller.fetchProduct(product_id: widget.product_id);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.change_index(0);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Observer(
        builder: (_) {
          return controller.products != null
              ? Bottomnavcard(product: controller.products!)
              : Container();
        },
      ),
      body: Observer(
        builder: (_) {
          return Skeletonizer(
            enableSwitchAnimation: true,
            enabled: controller.loading,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      controller.image.length == 0
                          ? Container()
                          : Productimage(product_id: controller.products!.id!),
                      controller.products != null
                          ? Productinformation(product: controller.products!)
                          : Container(),
                    ],
                  ),
                ),
                // SliverPadding(
                //   padding: EdgeInsets.symmetric(horizontal: 15),
                //   sliver: SliverGrid.builder(
                //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //       crossAxisCount: 2,
                //       childAspectRatio: 0.7,
                //       mainAxisSpacing: 12,
                //       crossAxisSpacing: 12,
                //     ),
                //     itemBuilder: (context, index) {
                //       return Productwidget(
                //         ontap: () {
                //           Navigator.pushNamed(
                //             context,
                //             RouteContstants.productDetailsRoute,
                //             arguments: 1
                //           );
                //         },
                //       );
                //     },
                //     itemCount: 6,
                //   ),
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}
