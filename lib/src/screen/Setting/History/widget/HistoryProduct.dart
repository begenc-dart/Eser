
import 'package:eser/src/screen/Setting/History/repository/data/HistoryData.dart';
import 'package:eser/src/utils/screen_export.dart';

class Historyproduct extends StatelessWidget {
  HistoryProducts product;
  Historyproduct({required this.product});
  var language_controller = GetIt.instance<LangugaeController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 102,
                      height: 125,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Networkimagewidget(
                          url:
                             Configs.imageUrl+ product.imageUrl!,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    SizedBox(
                      height: 125,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("${product.createdAt!.day}.${product.createdAt!.month}.${product.createdAt!.year}",style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                          ),),
                          Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(language_controller.currentLocale == Locale("tk")? product.productName!:product.productNameRu!,style: Theme.of(context).textTheme.labelSmall,),
                              Text(
                                            "${AppLocalizations.of(context)!.color} ${product.color}, ${AppLocalizations.of(context)!.sizes} ${product.size}",
                                            style:
                                                Theme.of(
                                                  context,
                                                ).textTheme.labelSmall,
                                          ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
  }
}