import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeProvider = ChangeNotifierProvider.autoDispose(
  (ref) => HomeProvider(),
);

class HomeProvider extends ChangeNotifier {
  Offset shadowOffset = const Offset(6, 6);

  void changeShadowOffsetOnHover(PointerHoverEvent event) {
    if (event.position.dy > 0) {
      shadowOffset = const Offset(6, -6);
    } else {
      shadowOffset = const Offset(6, 6);
    }
    notifyListeners();
  }
}
