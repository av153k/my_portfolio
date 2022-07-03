import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_portfolio/app/services/shared_preferences_service.dart';
import 'package:my_portfolio/app/utils/app_utils.dart';

final configProvider =
    ChangeNotifierProvider.autoDispose((ref) => ConfigProvider());

class ConfigProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  toggleThemeMode(ThemeMode mode) {
    AppUtils.logger.d('toggleThemeMode: $mode');
    themeMode = mode;
    notifyListeners();
    SharedPrefsService.instance.setString(
        SharedPrefsKeys.themeMode, mode == ThemeMode.dark ? 'dark' : 'light');
  }

  void setThemeAccToSystem() {
    String? cachedMode =
        SharedPrefsService.instance.getString(SharedPrefsKeys.themeMode);
    if (cachedMode == null) {
      toggleThemeMode(cachedMode == 'dark' ? ThemeMode.dark : ThemeMode.light);
    } else {
      toggleThemeMode(
          SchedulerBinding.instance.window.platformBrightness == Brightness.dark
              ? ThemeMode.dark
              : ThemeMode.light);
    }
  }
}
