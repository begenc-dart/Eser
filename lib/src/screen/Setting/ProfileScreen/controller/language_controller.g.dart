// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LangugaeController on _LangugaeControllerBase, Store {
  late final _$currentLocaleAtom =
      Atom(name: '_LangugaeControllerBase.currentLocale', context: context);

  @override
  Locale get currentLocale {
    _$currentLocaleAtom.reportRead();
    return super.currentLocale;
  }

  @override
  set currentLocale(Locale value) {
    _$currentLocaleAtom.reportWrite(value, super.currentLocale, () {
      super.currentLocale = value;
    });
  }

  late final _$languageAtom =
      Atom(name: '_LangugaeControllerBase.language', context: context);

  @override
  String get language {
    _$languageAtom.reportRead();
    return super.language;
  }

  @override
  set language(String value) {
    _$languageAtom.reportWrite(value, super.language, () {
      super.language = value;
    });
  }

  late final _$db_languageAtom =
      Atom(name: '_LangugaeControllerBase.db_language', context: context);

  @override
  String get db_language {
    _$db_languageAtom.reportRead();
    return super.db_language;
  }

  @override
  set db_language(String value) {
    _$db_languageAtom.reportWrite(value, super.db_language, () {
      super.db_language = value;
    });
  }

  late final _$getLanguageAsyncAction =
      AsyncAction('_LangugaeControllerBase.getLanguage', context: context);

  @override
  Future getLanguage() {
    return _$getLanguageAsyncAction.run(() => super.getLanguage());
  }

  late final _$_LangugaeControllerBaseActionController =
      ActionController(name: '_LangugaeControllerBase', context: context);

  @override
  void changeLanguage(String lan) {
    final _$actionInfo = _$_LangugaeControllerBaseActionController.startAction(
        name: '_LangugaeControllerBase.changeLanguage');
    try {
      return super.changeLanguage(lan);
    } finally {
      _$_LangugaeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void change(String newValue) {
    final _$actionInfo = _$_LangugaeControllerBaseActionController.startAction(
        name: '_LangugaeControllerBase.change');
    try {
      return super.change(newValue);
    } finally {
      _$_LangugaeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentLocale: ${currentLocale},
language: ${language},
db_language: ${db_language}
    ''';
  }
}
