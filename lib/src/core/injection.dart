import 'package:eser/src/screen/DashboardScreen/controller/banner_controller.dart';
import 'package:eser/src/screen/FavourityScreen/controller/favourity_controller.dart';
import 'package:eser/src/screen/CardScreen/controller/card_controller.dart';
import 'package:eser/src/screen/Setting/AddressScreen/controller/address_controller.dart';
import 'package:eser/src/screen/Setting/History/controller/history_controller.dart';
import 'package:eser/src/screen/Shopping/controller/market_product_controller.dart';
import 'package:eser/src/utils/screen_export.dart';

class AppInjection {
  void setup() {
    final GetIt getIt = GetIt.instance;
    getIt.registerFactory<DashboardController>(() => DashboardController());
    getIt.registerSingleton<ThemeStore>(ThemeStore());
    getIt.registerSingleton<DetailsController>(DetailsController());
    getIt.registerSingleton<FilterController>(FilterController());
    getIt.registerSingleton<BottomController>(BottomController());
    getIt.registerSingleton<ProfileController>(ProfileController());
    getIt.registerSingleton<ContactController>(ContactController());
    getIt.registerSingleton<OrderController>(OrderController());
    getIt.registerFactory<CategoriesController>(() => CategoriesController());
    getIt.registerSingleton<CreateAcountController>(CreateAcountController());
    getIt.registerSingleton<LoginController>(LoginController());
    getIt.registerSingleton<VerificationController>(VerificationController());
    getIt.registerSingleton<LangugaeController>(LangugaeController());
    getIt.registerSingleton<CardController>(CardController());
    getIt.registerSingleton<FavourityController>(FavourityController());
    getIt.registerSingleton<AddressController>(AddressController());
    getIt.registerSingleton<HistoryController>(HistoryController());
    getIt.registerSingleton<BannerController>(BannerController());
    getIt.registerFactory<MarketProductController>(
      () => MarketProductController(),
    );
  
  }
}
