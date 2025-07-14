
import 'package:eser/src/screen/CardScreen/repository/data/card_get_data.dart';
import 'package:eser/src/utils/screen_export.dart';

class Pricestaticswidget extends StatelessWidget {
  CardGetData product;
   Pricestaticswidget({required this.product});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Column(
          children: [
           _price(context,  AppLocalizations.of(context)!.price + ":", "${product.sum.toStringAsFixed(1)} TMT"),
           SizedBox(height: 10,),
           _price(context, AppLocalizations.of(context)!.dostawka, "${product.deliveryPrice} TMT"),
             SizedBox(height: 10,),
           Divider(color: Theme.of(context).colorScheme.surfaceContainerLow,),
             SizedBox(height: 10,),
            _price(context, AppLocalizations.of(context)!.sum, "${(product.sum+product.deliveryPrice!).toStringAsFixed(1)} TMT",FontWeight.w500),
              SizedBox(height: 10,),
          ],
        );
      }
    );
  }
  _price(BuildContext context,String title,String price,[FontWeight fontWeight=FontWeight.w400]){
    return  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
             title,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                fontWeight: fontWeight
              ),
            ),
            Text(price, style: Theme.of(context).textTheme.labelSmall!.copyWith(

              fontWeight: fontWeight
            )),
          ],
        );
  }
}
