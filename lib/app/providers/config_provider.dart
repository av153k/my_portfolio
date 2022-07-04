import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_portfolio/app/services/shared_preferences_service.dart';
import 'package:my_portfolio/app/utils/app_utils.dart';

final configProvider =
    ChangeNotifierProvider.autoDispose((ref) => ConfigProvider());

class ConfigProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  toggleThemeMode() {
    AppUtils.logger.d('toggleThemeMode: current themeMode $themeMode');
    if (themeMode == ThemeMode.dark) {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.dark;
    }
    notifyListeners();
    SharedPrefsService.instance.setString(
        SharedPrefsKeys.themeMode, themeMode == ThemeMode.dark ? 'dark' : 'light');
  }

  void setThemeAccToSystem() {
    String? cachedMode =
        SharedPrefsService.instance.getString(SharedPrefsKeys.themeMode);
    ThemeMode themeModeD = ThemeMode.light;
    if (cachedMode == null) {
      themeModeD = cachedMode == 'dark' ? ThemeMode.dark : ThemeMode.light;
    } else {
      themeModeD =
          SchedulerBinding.instance.window.platformBrightness == Brightness.dark
              ? ThemeMode.dark
              : ThemeMode.light;
    }

    if (themeModeD != themeMode) {
      toggleThemeMode();
    }
  }
}
