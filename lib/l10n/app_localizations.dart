import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ru.dart';
import 'app_localizations_tk.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ru'),
    Locale('tk')
  ];

  /// No description provided for @search.
  ///
  /// In tk, this message translates to:
  /// **'Gözleg'**
  String get search;

  /// No description provided for @sale.
  ///
  /// In tk, this message translates to:
  /// **'Sales'**
  String get sale;

  /// No description provided for @topSale.
  ///
  /// In tk, this message translates to:
  /// **'Top Sales'**
  String get topSale;

  /// No description provided for @description.
  ///
  /// In tk, this message translates to:
  /// **'Haryt barada'**
  String get description;

  /// No description provided for @relatedProduct.
  ///
  /// In tk, this message translates to:
  /// **'Meňzeş harytlar'**
  String get relatedProduct;

  /// No description provided for @other.
  ///
  /// In tk, this message translates to:
  /// **'Başgalar'**
  String get other;

  /// No description provided for @addCard.
  ///
  /// In tk, this message translates to:
  /// **'Sebede goş'**
  String get addCard;

  /// No description provided for @selectType.
  ///
  /// In tk, this message translates to:
  /// **'Görnüşini saýla'**
  String get selectType;

  /// No description provided for @size.
  ///
  /// In tk, this message translates to:
  /// **'Ölçegi'**
  String get size;

  /// No description provided for @filter.
  ///
  /// In tk, this message translates to:
  /// **'Filter'**
  String get filter;

  /// No description provided for @price.
  ///
  /// In tk, this message translates to:
  /// **'Bahasy'**
  String get price;

  /// No description provided for @started.
  ///
  /// In tk, this message translates to:
  /// **'Başlap'**
  String get started;

  /// No description provided for @ended.
  ///
  /// In tk, this message translates to:
  /// **'Çenli'**
  String get ended;

  /// No description provided for @sorted.
  ///
  /// In tk, this message translates to:
  /// **'Sortlamak'**
  String get sorted;

  /// No description provided for @defaut.
  ///
  /// In tk, this message translates to:
  /// **'Adaty'**
  String get defaut;

  /// No description provided for @chipToExpensive.
  ///
  /// In tk, this message translates to:
  /// **'Arazndan gymmada'**
  String get chipToExpensive;

  /// No description provided for @expensiveToChip.
  ///
  /// In tk, this message translates to:
  /// **'Gymmatdan arzana'**
  String get expensiveToChip;

  /// No description provided for @discount.
  ///
  /// In tk, this message translates to:
  /// **'Skidkadakylar'**
  String get discount;

  /// No description provided for @newProduct.
  ///
  /// In tk, this message translates to:
  /// **'Täze harytlar'**
  String get newProduct;

  /// No description provided for @filted.
  ///
  /// In tk, this message translates to:
  /// **'Filterle'**
  String get filted;

  /// No description provided for @favourity.
  ///
  /// In tk, this message translates to:
  /// **'Halanlarym'**
  String get favourity;

  /// No description provided for @mainPage.
  ///
  /// In tk, this message translates to:
  /// **'Baş sahypa'**
  String get mainPage;

  /// No description provided for @category.
  ///
  /// In tk, this message translates to:
  /// **'Kategoriýa'**
  String get category;

  /// No description provided for @categories.
  ///
  /// In tk, this message translates to:
  /// **'Kategoriýalar'**
  String get categories;

  /// No description provided for @shopping.
  ///
  /// In tk, this message translates to:
  /// **'Dükanlar'**
  String get shopping;

  /// No description provided for @card.
  ///
  /// In tk, this message translates to:
  /// **'Sebet'**
  String get card;

  /// No description provided for @profile.
  ///
  /// In tk, this message translates to:
  /// **'Profil'**
  String get profile;

  /// No description provided for @language.
  ///
  /// In tk, this message translates to:
  /// **'Interfeýs dili'**
  String get language;

  /// No description provided for @address.
  ///
  /// In tk, this message translates to:
  /// **'Salgylarym'**
  String get address;

  /// No description provided for @terms.
  ///
  /// In tk, this message translates to:
  /// **'Ulanyş düzgünleri'**
  String get terms;

  /// No description provided for @contace.
  ///
  /// In tk, this message translates to:
  /// **'Habarlaşmak'**
  String get contace;

  /// No description provided for @theme.
  ///
  /// In tk, this message translates to:
  /// **'Dark Mode'**
  String get theme;

  /// No description provided for @about.
  ///
  /// In tk, this message translates to:
  /// **'Biz barada'**
  String get about;

  /// No description provided for @logOut.
  ///
  /// In tk, this message translates to:
  /// **'Ulgamdan çykmak'**
  String get logOut;

  /// No description provided for @exit.
  ///
  /// In tk, this message translates to:
  /// **'Ulgamdan çykmak'**
  String get exit;

  /// No description provided for @exitis.
  ///
  /// In tk, this message translates to:
  /// **'Siz hakykatdan ulgamdan çykmakçymy?'**
  String get exitis;

  /// No description provided for @no.
  ///
  /// In tk, this message translates to:
  /// **'Ýok'**
  String get no;

  /// No description provided for @yes.
  ///
  /// In tk, this message translates to:
  /// **'Hawa'**
  String get yes;

  /// No description provided for @name.
  ///
  /// In tk, this message translates to:
  /// **'Doly adyňyz'**
  String get name;

  /// No description provided for @phone.
  ///
  /// In tk, this message translates to:
  /// **'Telefon belgiňiz'**
  String get phone;

  /// No description provided for @text.
  ///
  /// In tk, this message translates to:
  /// **'Tekst'**
  String get text;

  /// No description provided for @next.
  ///
  /// In tk, this message translates to:
  /// **'Dowam et'**
  String get next;

  /// No description provided for @validationPhone.
  ///
  /// In tk, this message translates to:
  /// **'Telefon belgiňiz 6 ýa-da 7 den başlat'**
  String get validationPhone;

  /// No description provided for @color.
  ///
  /// In tk, this message translates to:
  /// **'Reňk:'**
  String get color;

  /// No description provided for @sizes.
  ///
  /// In tk, this message translates to:
  /// **'Razmer: '**
  String get sizes;

  /// No description provided for @dostawka.
  ///
  /// In tk, this message translates to:
  /// **'Eltip bermek: '**
  String get dostawka;

  /// No description provided for @sum.
  ///
  /// In tk, this message translates to:
  /// **'Jemi: '**
  String get sum;

  /// No description provided for @orderConform.
  ///
  /// In tk, this message translates to:
  /// **'Sargydy tassyklaň'**
  String get orderConform;

  /// No description provided for @selectAddress.
  ///
  /// In tk, this message translates to:
  /// **'Salgyňyz: Saýlanmadyk'**
  String get selectAddress;

  /// No description provided for @note.
  ///
  /// In tk, this message translates to:
  /// **'Bellik'**
  String get note;

  /// No description provided for @warring.
  ///
  /// In tk, this message translates to:
  /// **'*Bellik: Töleg nagyt görnüşinde kabul edilýär!'**
  String get warring;

  /// No description provided for @conformOrder.
  ///
  /// In tk, this message translates to:
  /// **'Sargydy tassykla'**
  String get conformOrder;

  /// No description provided for @selectAddres.
  ///
  /// In tk, this message translates to:
  /// **'Salgyňyzy saýlaň'**
  String get selectAddres;

  /// No description provided for @addAdress.
  ///
  /// In tk, this message translates to:
  /// **'Adress goş'**
  String get addAdress;

  /// No description provided for @save.
  ///
  /// In tk, this message translates to:
  /// **'Ýatda sakla'**
  String get save;

  /// No description provided for @addAddress.
  ///
  /// In tk, this message translates to:
  /// **'Täze salgy goş'**
  String get addAddress;

  /// No description provided for @cancel.
  ///
  /// In tk, this message translates to:
  /// **'Goýbolsun et'**
  String get cancel;

  /// No description provided for @conform.
  ///
  /// In tk, this message translates to:
  /// **'Tassykla'**
  String get conform;

  /// No description provided for @addressName.
  ///
  /// In tk, this message translates to:
  /// **'Salgyňyzyň ady'**
  String get addressName;

  /// No description provided for @addressFull.
  ///
  /// In tk, this message translates to:
  /// **'Salgyňyz'**
  String get addressFull;

  /// No description provided for @edit.
  ///
  /// In tk, this message translates to:
  /// **'Düzetmek'**
  String get edit;

  /// No description provided for @delete.
  ///
  /// In tk, this message translates to:
  /// **'Öçürmek'**
  String get delete;

  /// No description provided for @deleteAddress.
  ///
  /// In tk, this message translates to:
  /// **'Siz salgyny pozmakçymy?'**
  String get deleteAddress;

  /// No description provided for @order.
  ///
  /// In tk, this message translates to:
  /// **'Sargytlarym'**
  String get order;

  /// No description provided for @newShopping.
  ///
  /// In tk, this message translates to:
  /// **'Täze dükanlar'**
  String get newShopping;

  /// No description provided for @vipShopping.
  ///
  /// In tk, this message translates to:
  /// **'VIP dükanlar'**
  String get vipShopping;

  /// No description provided for @clean.
  ///
  /// In tk, this message translates to:
  /// **'Arrasalamak'**
  String get clean;

  /// No description provided for @createAcount.
  ///
  /// In tk, this message translates to:
  /// **'Täze hasap döret'**
  String get createAcount;

  /// No description provided for @login.
  ///
  /// In tk, this message translates to:
  /// **'Hasabym bar, ulgama gir'**
  String get login;

  /// No description provided for @welcome.
  ///
  /// In tk, this message translates to:
  /// **'Hoş geldiňiz!'**
  String get welcome;

  /// No description provided for @createAccount.
  ///
  /// In tk, this message translates to:
  /// **'Hasap döret'**
  String get createAccount;

  /// No description provided for @informationAccount.
  ///
  /// In tk, this message translates to:
  /// **'Söwda etmäge başlamak üçin hasap dörediň'**
  String get informationAccount;

  /// No description provided for @terms1.
  ///
  /// In tk, this message translates to:
  /// **'Maglumatlary doldurup dowam etmek bilen'**
  String get terms1;

  /// No description provided for @terms2.
  ///
  /// In tk, this message translates to:
  /// **' Ulanyş düzgünlerini'**
  String get terms2;

  /// No description provided for @terms3.
  ///
  /// In tk, this message translates to:
  /// **' kabul edýärin'**
  String get terms3;

  /// No description provided for @loginText.
  ///
  /// In tk, this message translates to:
  /// **'Ulgama gir'**
  String get loginText;

  /// No description provided for @loginDesc.
  ///
  /// In tk, this message translates to:
  /// **'Hoş geldiňiz, ulgama girmek üçin telefon belgiňizi giriziň'**
  String get loginDesc;

  /// No description provided for @verificationCode.
  ///
  /// In tk, this message translates to:
  /// **'Tassyklaýjy kody giriziň'**
  String get verificationCode;

  /// No description provided for @code.
  ///
  /// In tk, this message translates to:
  /// **'belgä ugradylan kody giriziň'**
  String get code;

  /// No description provided for @newSend.
  ///
  /// In tk, this message translates to:
  /// **'Täzeden ugrat'**
  String get newSend;

  /// No description provided for @storyInformation.
  ///
  /// In tk, this message translates to:
  /// **'Dükan barada'**
  String get storyInformation;

  /// No description provided for @fullData.
  ///
  /// In tk, this message translates to:
  /// **'Maglumaty doly we dogry giriziň'**
  String get fullData;

  /// No description provided for @cardadd.
  ///
  /// In tk, this message translates to:
  /// **'Harydynyz sebede gosuldy'**
  String get cardadd;

  /// No description provided for @addresAdded.
  ///
  /// In tk, this message translates to:
  /// **'Salgynyz usdinlikli gosuldy'**
  String get addresAdded;

  /// No description provided for @errorDelete.
  ///
  /// In tk, this message translates to:
  /// **'Tazeden synanysmagynyzy hayys edyaris'**
  String get errorDelete;

  /// No description provided for @putAddress.
  ///
  /// In tk, this message translates to:
  /// **'Salgynyz usdinlikli uytgedildi'**
  String get putAddress;

  /// No description provided for @successfullyOrder.
  ///
  /// In tk, this message translates to:
  /// **'Sargydynyz kabul edildi'**
  String get successfullyOrder;

  /// No description provided for @selectedAddress.
  ///
  /// In tk, this message translates to:
  /// **'Salgynyzy saylamagynyzy sizden hayys edyarin'**
  String get selectedAddress;

  /// No description provided for @successSend.
  ///
  /// In tk, this message translates to:
  /// **'Yazgynyz usdinlikli ugradyldy'**
  String get successSend;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ru', 'tk'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ru': return AppLocalizationsRu();
    case 'tk': return AppLocalizationsTk();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
