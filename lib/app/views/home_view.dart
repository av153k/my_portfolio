import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_portfolio/app/utils/app_size.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppSize.init(context);
    return Scaffold(
      body: MouseRegion(
        child: SafeArea(
          child: Center(
            child: Container(
              width: AppSize.screenWidth * 0.5,
              height: AppSize.screenHeight * 0.5,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                    ),
                  ]),
              child: Text(
                'Hi, I am Abhishek Anand 👋',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
