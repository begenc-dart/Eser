import 'package:eser/src/core/network/dio_helper.dart';
import 'package:eser/src/screen/DashboardScreen/repository/data/product_data.dart';
import 'package:eser/src/utils/screen_export.dart';

class Productwidget extends StatelessWidget {
  VoidCallback ontap;
  ProductData? product;
  VoidCallback favourityOnTap;
  bool isFavourity;
  Productwidget({required this.ontap,required this.isFavourity, this.product,required this.favourityOnTap});
  var controller = GetIt.instance<LangugaeController>();
  var verification = GetIt.instance<VerificationController>();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).colorScheme.onSecondary,
          border: Border.all(color: Theme.of(context).colorScheme.onPrimary),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: Networkimagewidget(
                        url: Configs.imageUrl + product!.thumbnailUrl!,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    top: 10,
                    child: Column(
                      children: [
                        product!.isNew!
                            ? Discountcontainer(
                              colors:
                                  Theme.of(
                                    context,
                                  ).colorScheme.surfaceContainer,
                              title: "New",
                            )
                            : Container(),
                        SizedBox(height: 4),
                        product!.discount != null && product!.discount != 0
                            ? Discountcontainer(
                              colors: Theme.of(context).colorScheme.onError,
                              title: "${product!.discount}%",
                            )
                            : Container(),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: InkWell(
                      onTap: verification.hasData? favourityOnTap:(){
                        Navigator.pushNamed(context, RouteContstants.welcomeScreenRoute);
                      },
                      child: Icon(
                    isFavourity
                        ? Icons.favorite
                        : Icons.favorite_border_rounded,
                    color:
                       isFavourity
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).colorScheme.primary,
                  ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.currentLocale == Locale("tk")
                        ? product!.name!
                        : product!.nameRu!,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${product!.finalPrice!.toInt()} TMT",
                        style: Theme.of(
                          context,
                        ).textTheme.labelMedium!.copyWith(fontSize: 14),
                      ),
                      product!.discount != null && product!.discount != 0
                          ? Text(
                            "${product!.price!.toInt()} TMT",
                            style: Theme.of(
                              context,
                            ).textTheme.labelMedium!.copyWith(
                              fontSize: 14,
                              decoration: TextDecoration.lineThrough,
                              decorationThickness: 2,
                              decorationColor:
                                  Theme.of(context).colorScheme.onError,
                            ),
                          )
                          : Container(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
