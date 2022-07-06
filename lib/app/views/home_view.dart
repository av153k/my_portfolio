import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_portfolio/app/providers/config_provider.dart';
import 'package:my_portfolio/app/utils/app_size.dart';

import '../providers/home_provider.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(homeProvider);
    AppSize.init(context);
    return Scaffold(
      body: MouseRegion(
        onHover: provider.changeShadowOffsetOnHover,
        child: SafeArea(
          child: Center(
            child: GestureDetector(
              onTap: ref.read(configProvider).toggleThemeMode,
              child: Container(
                width: AppSize.screenWidth * 0.4,
                height: AppSize.screenHeight * 0.4,
                padding: const EdgeInsets.all(8),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).primaryColor,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Theme.of(context).shadowColor,
                      blurRadius: 10,
                      offset: provider.shadowOffset,
                    ),
                  ],
                ),
                child: Text(
                  'Hi, I am Abhishek Anand \u{1f44b}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
