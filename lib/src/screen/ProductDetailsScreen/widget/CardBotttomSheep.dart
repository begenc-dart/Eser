import 'package:eser/src/screen/CardScreen/controller/card_controller.dart';
import 'package:eser/src/screen/CardScreen/repository/data/CardAddData.dart';
import 'package:eser/src/screen/ProductDetailsScreen/repository/data/OneProductData.dart';
import 'package:eser/src/utils/screen_export.dart';

cardBottomSheep(BuildContext context, OneProductData product) {
  var controller = GetIt.instance<DetailsController>();
  var cardController = GetIt.instance<CardController>();
  showModalBottomSheet(
    backgroundColor: Theme.of(context).colorScheme.onSecondary,
    context: context,
    builder: (context) {
      controller.changeColor(0);
      return Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Row(
                  children: [
                    Observer(
                      builder: (_) {
                        return Text(
                          product.thumbnails.length == 0
                              ? "${product.finalPrice}"
                              : "${product.thumbnails[controller.selectColor].sizes[controller.selectSize].price} TMT",
                          style: Theme.of(
                            context,
                          ).textTheme.labelLarge!.copyWith(fontSize: 22),
                        );
                      },
                    ),
                    SizedBox(width: 15),
                  ],
                ),
                SizedBox(height: 5),
                Observer(
                  builder: (_) {
                    return Text(
                      product.thumbnails.length == 0
                          ? "${product.name}"
                          : "“${product.thumbnails[controller.selectColor].color}”",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  },
                ),
                product.thumbnails.length == 0
                    ? Container()
                    : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Text(
                          AppLocalizations.of(context)!.selectType,
                          style: Theme.of(
                            context,
                          ).textTheme.labelSmall!.copyWith(fontSize: 18),
                        ),
                        SizedBox(height: 5),
                        SizedBox(
                          width: double.infinity,
                          height: 100,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                for (
                                  int i = 0;
                                  i < product.thumbnails.length;
                                  i++
                                )
                                  Observer(
                                    builder: (_) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          right: 5,
                                        ),
                                        child: Container(
                                          decoration:
                                              controller.selectColor == i
                                                  ? BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          5,
                                                        ),
                                                    border: Border.all(
                                                      color:
                                                          Theme.of(context)
                                                              .colorScheme
                                                              .secondary,
                                                    ),
                                                  )
                                                  : null,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              5,
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                controller.changeColor(i);
                                                controller.changeSize(0);
                                              },
                                              child: Networkimagewidget(
                                                url:
                                                    Configs.imageUrl +
                                                    product
                                                        .thumbnails[i]
                                                        .imageUrl!,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          AppLocalizations.of(context)!.size,
                          style: Theme.of(
                            context,
                          ).textTheme.labelSmall!.copyWith(fontSize: 18),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                for (
                                  int i = 0;
                                  i <
                                      product
                                          .thumbnails[controller.selectColor]
                                          .sizes
                                          .length;
                                  i++
                                )
                                  Observer(
                                    builder: (_) {
                                      return InkWell(
                                        onTap: () {
                                          controller.changeSize(i);
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(right: 3),
                                          width: 46,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            color:
                                                controller.selectSize == i
                                                    ? Theme.of(
                                                      context,
                                                    ).colorScheme.secondary
                                                    : Theme.of(
                                                      context,
                                                    ).colorScheme.onPrimary,
                                          ),
                                          child: Center(
                                            child: Text(
                                              product
                                                  .thumbnails[controller
                                                      .selectColor]
                                                  .sizes[i]
                                                  .size!,
                                              style:
                                                  controller.selectSize == i
                                                      ? Theme.of(context)
                                                          .textTheme
                                                          .bodySmall!
                                                          .copyWith(
                                                            fontSize: 14,
                                                          )
                                                      : Theme.of(context)
                                                          .textTheme
                                                          .labelSmall!
                                                          .copyWith(
                                                            fontSize: 14,
                                                          ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 7,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimary,
                        borderRadius: BorderRadius.circular(10),
                      ),

                      child: Row(
                        children: [
                          InkWell(
                            onTap: controller.add_count,
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                              child: Icon(Icons.add),
                            ),
                          ),
                          SizedBox(width: 15),
                          Observer(
                            builder: (_) {
                              return Text(
                                controller.count.toString(),
                                style: Theme.of(
                                  context,
                                ).textTheme.labelSmall!.copyWith(fontSize: 22),
                              );
                            },
                          ),
                          SizedBox(width: 10),
                          InkWell(
                            onTap: controller.remove_count,
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                              child: Icon(Icons.remove),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Savebutton(
                  onTapCancel: () {
                    Navigator.pop(context);
                  },
                  onTapConform: () {
                    cardController.addCardProduct(
                      context,
                      () {
                        GetIt.instance<CardController>().fetchCard();
                        Navigator.pop(context);

                      },
                      CardDataPost(
                        count: controller.count,
                        productId: product.id,
                        sizeId:
                            product
                                .thumbnails[controller.selectColor]
                                .sizes[controller.selectSize]
                                .id,
                        thumbnailId:
                            product.thumbnails[controller.selectColor].id,
                      ),
                    );
                  },
                  titleCancel: AppLocalizations.of(context)!.cancel,
                  titleConform: AppLocalizations.of(context)!.conform,
                  isColorless: false,
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
