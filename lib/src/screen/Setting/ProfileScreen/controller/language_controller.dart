import 'package:mobx/mobx.dart';

import 'package:eser/src/utils/screen_export.dart';
part 'language_controller.g.dart';

class LangugaeController = _LangugaeControllerBase with _$LangugaeController;

abstract class _LangugaeControllerBase with Store {
  @observable
  Locale currentLocale = Locale('tk');
  @action
  void changeLanguage(String lan) {
    currentLocale = Locale(lan);
  }

  @observable
  String language = "";
  @action
  void change(String newValue) {
    language = newValue;
  }

  final _keyValueStorageService = KeyValueStorageService();

  void updateLanguage(String key, String newToken) {
    _keyValueStorageService.setShared(key, newToken.toString());
  }

  @observable
  String db_language = "";
  @action
  getLanguage() async {
    db_language =
        await _keyValueStorageService.getSharedPref("language") ?? 'tk';

    changeLanguage(db_language);
    language = db_language;
  }
}
