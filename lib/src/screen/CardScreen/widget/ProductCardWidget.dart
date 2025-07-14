
import 'package:eser/src/screen/CardScreen/repository/api/CardApi.dart';
import 'package:eser/src/utils/screen_export.dart';

class Productcardwidget extends StatelessWidget {
  Product product;
  VoidCallback onTapAdd;
  VoidCallback onTapDelete;
  VoidCallback onTapRemove;
  Productcardwidget({required this.product,required this.onTapDelete,required this.onTapAdd,required this.onTapRemove});
  var language_controller = GetIt.instance<LangugaeController>();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 10, 16),
          child: SizedBox(
            width: 102,
            height: 126,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Networkimagewidget(
                url: Configs.imageUrl + product.thumbnailUrl!,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),

        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                        language_controller.currentLocale==Locale("tk")?  product.name!.toString():product.nameRu!,
                          style: Theme.of(
                            context,
                          ).textTheme.labelSmall!.copyWith(fontSize: 15),
                        ),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          "${AppLocalizations.of(context)!.color} ${product.color}, ${AppLocalizations.of(context)!.sizes} ${product.size}",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: onTapDelete,
                    child: SvgPicture.asset(Staticsimage.delte)),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.sizePrice != 0 || product.sizePrice == null
                            ? "${product.sizePrice} TMT"
                            : "${product.price} TMT",
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSecondary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: onTapAdd,
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                            child: Icon(Icons.add),
                          ),
                        ),
                        SizedBox(width: 10),
                        Observer(
                          builder: (_) {
                            return Text(
                              "${product.count}",
                              style: Theme.of(context).textTheme.labelMedium!
                                  .copyWith(fontWeight: FontWeight.w500),
                            );
                          },
                        ),
                        SizedBox(width: 10),
                        InkWell(
                          onTap: onTapRemove,
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                            child: Icon(Icons.remove),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
