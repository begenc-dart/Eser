import  'package:mobx/mobx.dart';
import '../utils/screen_export.dart';
part 'theme_manager.g.dart';

class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  @observable
  ThemeMode themeMode = ThemeMode.light; 

  @action
  void toggleTheme(bool isDark) {
    if (isDark ) {
      themeMode = ThemeMode.dark;
    } else if (!isDark) {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.system;
    }
  }

  @observable
  bool isDark = false;
  @action
  void change_theme() {
    isDark = !isDark;
  }
}
