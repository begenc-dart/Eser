import 'package:eser/src/screen/OrderScreen/model/OrderModel.dart';
import 'package:eser/src/screen/ProductScreen/model/ProductModel.dart';
import 'package:eser/src/screen/ProductScreen/presentation/ProductScreen.dart';
import 'package:eser/src/screen/Shopping/model/MarketModel.dart';
import 'package:eser/src/screen/Shopping/presentation/ShoppingScreen.dart';
import 'package:eser/src/utils/screen_export.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteContstants.productDetailsRoute:
      int id = settings.arguments as int;
      return MaterialPageRoute(
        builder: (context) => Productdetailsscreen(product_id: id),
      );
    case RouteContstants.dashboardScreenRoute:
      return MaterialPageRoute(builder: (context) => Dashboardscreen());
    case RouteContstants.filterScreenRoute:
      VoidCallback onTap = settings.arguments as VoidCallback? ?? () {};

      return MaterialPageRoute(
        builder: (context) => Filterscreen(onTap: onTap),
      );
    case RouteContstants.favourityScreenRoute:
      return MaterialPageRoute(builder: (context) => Favourityscreen());
    case RouteContstants.bottomScreenRoute:
      return MaterialPageRoute(builder: (context) => Bottomnavscreen());
    case RouteContstants.termsScreenRoute:
      return MaterialPageRoute(builder: (context) => Termsscreen());
    case RouteContstants.contactScreenRoute:
      return MaterialPageRoute(builder: (context) => Contactscreen());
    case RouteContstants.orderScreenRoute:
      Ordermodel model = settings.arguments as Ordermodel;
      return MaterialPageRoute(
        builder: (context) => Orderscreen(orders: model),
      );
    case RouteContstants.addressScreenRoute:
      return MaterialPageRoute(builder: (context) => Addressscreen());
    case RouteContstants.historyScreenRoute:
      return MaterialPageRoute(builder: (context) => Historyscreen());
    case RouteContstants.welcomeScreenRoute:
      return MaterialPageRoute(builder: (context) => Welcomescreen());
    case RouteContstants.Createaccountscreen:
      return MaterialPageRoute(builder: (context) => Createaccountscreen());
    case RouteContstants.loginScreen:
      return MaterialPageRoute(builder: (context) => Loginscreen());
    case RouteContstants.verificationScreen:
      String phone = settings.arguments as String;
      return MaterialPageRoute(
        builder: (context) => Verificationpage(phone: phone),
      );
    case RouteContstants.shopping:
      Marketmodel marketmodel = settings.arguments as Marketmodel;
      return MaterialPageRoute(
        builder: (context) => Shoppingscreen(market: marketmodel),
      );
    case RouteContstants.productScreen:
      Productmodel url = settings.arguments as Productmodel;

      return MaterialPageRoute(builder: (context) => Productscreen(model: url));
    default:
      return MaterialPageRoute(builder: (context) => Dashboardscreen());
  }
}
