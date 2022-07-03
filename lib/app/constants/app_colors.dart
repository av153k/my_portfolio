part of 'app_constants.dart';

class AppColors {
  static MaterialColor primaryColorDark =
      getMaterialColor(const Color(0xff232931));
  static const Color secondaryColorDark = Color(0xff393E46);
  static const Color tertiaryColorDark = Color(0xff4ECCA3);
  static const Color textColorDark = Color(0xffEEEEEE);
  static MaterialColor primaryColorLight =
      getMaterialColor(const Color(0xffFCF8EC));
  static const Color secondaryColorLight = Color(0xffD0E8F2);
  static const Color tertiaryColorLight = Color(0xff79A3B1);
  static const Color textColorLight = Color(0xff456268);

  static final Map<int, Color> _colorCodes = {
    50: const Color.fromRGBO(147, 205, 72, .1),
    100: const Color.fromRGBO(147, 205, 72, .2),
    200: const Color.fromRGBO(147, 205, 72, .3),
    300: const Color.fromRGBO(147, 205, 72, .4),
    400: const Color.fromRGBO(147, 205, 72, .5),
    500: const Color.fromRGBO(147, 205, 72, .6),
    600: const Color.fromRGBO(147, 205, 72, .7),
    700: const Color.fromRGBO(147, 205, 72, .8),
    800: const Color.fromRGBO(147, 205, 72, .9),
    900: const Color.fromRGBO(147, 205, 72, 1),
  };

  static MaterialColor getMaterialColor(Color color) {
    return MaterialColor(color.value, _colorCodes);
  }
}
