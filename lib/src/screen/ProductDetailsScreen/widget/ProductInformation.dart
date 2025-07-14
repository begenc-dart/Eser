import 'package:eser/src/screen/ProductDetailsScreen/repository/data/OneProductData.dart';
import 'package:eser/src/utils/screen_export.dart';

class Productinformation extends StatelessWidget {
  OneProductData product;
  Productinformation({required this.product});
  var language_controller = GetIt.instance<LangugaeController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    language_controller.currentLocale == Locale("tk")
                        ? product.name!
                        : product.nameRu!,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    product.marketName!,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "${product.finalPrice} TMT",
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  product.discount != 0 || product.discount != null
                      ? Text(
                        "${product.price} TMT",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
          SizedBox(height: 10),
          Text(
            AppLocalizations.of(context)!.description,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10),
          Text(
            language_controller.currentLocale == Locale("tk")
                ? product.description!
                : product.descriptionRu!,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          SizedBox(height: 10),
          Text(
            AppLocalizations.of(context)!.relatedProduct,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
