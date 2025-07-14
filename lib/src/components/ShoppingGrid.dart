import 'package:eser/src/screen/CategoriesScreen/repository/data/MarketData.dart';
import 'package:eser/src/utils/screen_export.dart';

class Shoppinggrid extends StatelessWidget {
  bool isNew;
  bool isVip;
  VoidCallback onTap;
  MarketData? market;
  Shoppinggrid({
    this.isNew = false,
    this.market,
    this.isVip = false,
    required this.onTap,
  });
  var controller = GetIt.instance<LangugaeController>();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SizedBox(
                            width: 90,
                            height: 80,
                            child: Networkimagewidget(
                              url: Configs.imageUrl + market!.thumbnailUrl!,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                isNew || isVip
                    ? Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color:
                              isNew
                                  ? Theme.of(
                                    context,
                                  ).colorScheme.surfaceContainer
                                  : Color.fromRGBO(255, 192, 21, 1),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: Text(
                          isNew ? "New" : "Vip",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    )
                    : Container(),
              ],
            ),
          ),
          Text(
            controller.currentLocale == Locale("tk")
                ? market!.name!
                : market!.nameRu!,
            style: Theme.of(
              context,
            ).textTheme.labelSmall!.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
