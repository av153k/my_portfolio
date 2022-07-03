import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_portfolio/app/constants/app_constants.dart';
import 'package:my_portfolio/app/providers/config_provider.dart';
import 'package:my_portfolio/app/services/shared_preferences_service.dart';
import 'package:my_portfolio/app/views/home_view.dart';

void main() async {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(configProvider);
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        config.setThemeAccToSystem();
      });
      return null;
    }, []);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: config.themeMode,
      theme: AppConstants.themes.lightThemeData,
      darkTheme: AppConstants.themes.darkThemeData,
      home: const HomeView(),
    );
  }
}

initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsService.instance.initialize();
}
