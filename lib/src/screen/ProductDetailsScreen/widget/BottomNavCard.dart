import 'package:eser/src/screen/ProductDetailsScreen/repository/data/OneProductData.dart';
import 'package:eser/src/utils/screen_export.dart';

class Bottomnavcard extends StatelessWidget {
  OneProductData product;
  Bottomnavcard({required this.product});
  var verification = GetIt.instance<VerificationController>();
  var language_controller = GetIt.instance<LangugaeController>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RouteContstants.shopping,
                    arguments: Marketmodel(
                      id: product.marketId!,
                      title:
                          language_controller.currentLocale == Locale("tk")
                              ? product.marketName!
                              : product.marketNameRu!,
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Staticsimage.shop),
                      SizedBox(width: 10),
                      Text(
                        language_controller.currentLocale == Locale("tk")
                            ? product.marketName!
                            : product.marketNameRu!,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: InkWell(
                onTap:
                    verification.hasData
                        ? () {
                          cardBottomSheep(context, product);
                        }
                        : () {
                          Navigator.pushNamed(
                            context,
                            RouteContstants.welcomeScreenRoute,
                          );
                        },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(3, 6),
                        blurRadius: 10,
                        color: Color.fromRGBO(0, 0, 0, 0.2),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Staticsimage.card),
                      SizedBox(width: 10),
                      Text(
                        AppLocalizations.of(context)!.addCard,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimaryFixed,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
