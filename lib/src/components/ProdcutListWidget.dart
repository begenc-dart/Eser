import '../utils/screen_export.dart';

class Prodcutlistwidget extends StatelessWidget {
  ProductData product;
  VoidCallback onTap;
  VoidCallback onTapFavourity;
  Prodcutlistwidget({
    required this.product,
    required this.onTap,
    required this.onTapFavourity,
  });
  var langauge_controller = GetIt.instance<LangugaeController>();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Theme.of(context).colorScheme.onPrimary),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 16, 10),
                  child: SizedBox(
                    width: 102,
                    height: 108,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Networkimagewidget(
                        url: Configs.imageUrl + product.thumbnailUrl!,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                    langauge_controller.currentLocale==Locale("tk")?  product.name!:product.nameRu!,
                      style: Theme.of(
                        context,
                      ).textTheme.labelSmall!.copyWith(fontSize: 16),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "${product.finalPrice} TMT",
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    product.discount == 0 || product.discount == null
                        ? Container()
                        : Text(
                          "${product.price} TMT",
                          style: Theme.of(
                            context,
                          ).textTheme.labelMedium!.copyWith(
                            fontSize: 14,
                            decoration: TextDecoration.lineThrough,
                            decorationThickness: 2,
                            decorationColor:
                                Theme.of(context).colorScheme.onError,
                          ),
                        ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        if (product.isNew!)
                          Discountcontainer(
                            colors:
                                Theme.of(context).colorScheme.surfaceContainer,
                            title: "New",
                          ),
                        SizedBox(width: 5),
                        if (product.discount != 0 || product.discount != null)
                          Discountcontainer(
                            colors: Theme.of(context).colorScheme.onError,
                            title: "${product.discount}%",
                          ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
              onPressed: onTapFavourity,
              icon: Icon(
                Icons.favorite,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
