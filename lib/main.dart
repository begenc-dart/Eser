import 'package:eser/src/core/injection.dart';
import 'package:eser/src/core/local/key_value_storage_base.dart';
import 'package:eser/src/routes/route.dart' as router;
import 'package:eser/src/routes/route_contstants.dart';
import 'package:eser/src/screen/Setting/AddressScreen/controller/address_controller.dart';
import 'package:eser/src/screen/Setting/ProfileScreen/controller/language_controller.dart';
import 'package:eser/src/themes/theme_constants.dart';
import 'package:eser/src/themes/theme_manager.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:eser/src/utils/screen_export.dart';

import 'l10n/app_localizations.dart';
import 'l10n/tk_material_localizations.dart';
import 'src/screen/auth/VerificationScreen/controller/verification_controller.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  AppInjection().setup();
  await KeyValueStorageBase.init();
  await GetIt.instance<LangugaeController>().getLanguage();
  await GetIt.instance<VerificationController>().tokenGet();
  runApp(MainPage());
}

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var addressController = GetIt.instance<AddressController>();
  @override
  void initState() {
    // TODO: implement initState
    addressController.fetchAddress();
    super.initState();
  }

  final _themeManger = GetIt.instance<ThemeStore>();

  final languageController = GetIt.instance<LangugaeController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return MaterialApp(
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations
                .delegate, // Add global material localization
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            TkMaterialLocalizationsDelegate(), // Custom Turkmen Material delegate
            TkCupertinoLocalizationsDelegate(),
          ],
          supportedLocales: [Locale('ru'), Locale("tk")],
          locale: languageController.currentLocale,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: _themeManger.themeMode,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: router.generateRoute,
          initialRoute: RouteContstants.bottomScreenRoute,
        );
      },
    );
  }
}
