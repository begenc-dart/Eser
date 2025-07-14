import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// Custom Turkmen Localization Delegate
class TkMaterialLocalizationsDelegate extends LocalizationsDelegate<MaterialLocalizations> {
  const TkMaterialLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'tk';

  @override
  Future<MaterialLocalizations> load(Locale locale) async {
    // Use Russian as a base for now (Flutter does not support tk natively)
    return GlobalMaterialLocalizations.delegate.load(const Locale('ru'));
  }

  @override
  bool shouldReload(LocalizationsDelegate<MaterialLocalizations> old) => false;
}

/// Custom Turkmen Cupertino Localization Delegate
class TkCupertinoLocalizationsDelegate extends LocalizationsDelegate<CupertinoLocalizations> {
  const TkCupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'tk';

  @override
  Future<CupertinoLocalizations> load(Locale locale) async {
    // Use Russian as a base for Cupertino widgets
    return GlobalCupertinoLocalizations.delegate.load(const Locale('ru'));
  }

  @override
  bool shouldReload(LocalizationsDelegate<CupertinoLocalizations> old) => false;
}
