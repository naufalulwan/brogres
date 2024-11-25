part of '../global.dart';

class ColorUtil {
  final Color primaryOrange = color("#FFBA22");
  final Color secondaryVanilla = color("#FFDE97");
  final Color tertiaryBlack = color("#372F2F");
  final Color touchesBlue = color("#003CFF");
  final Color paymentGreen = color("#8DFF22");
  final Color errorRed = color("#AF1740");
  final Color disabledAnthracite = color("404258");

  static MaterialColor color(String hexValue) {
    Color? value;

    try {
      if (hexValue.startsWith('#')) {
        hexValue = hexValue.replaceAll("#", "");
      }

      if (hexValue.length == 6) {
        hexValue = "FF$hexValue";
      }
    } catch (e) {
      throw Exception("Invalid hex color value: $hexValue");
    }

    value = Color(int.parse("0x$hexValue"));

    return MaterialColor(value.value, {
      50: tintColor(value, 0.9),
      100: tintColor(value, 0.8),
      200: tintColor(value, 0.6),
      300: tintColor(value, 0.4),
      400: tintColor(value, 0.2),
      500: value,
      600: shadeColor(value, 0.1),
      700: shadeColor(value, 0.2),
      800: shadeColor(value, 0.3),
      900: shadeColor(value, 0.4),
    });
  }

  static int _tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  static Color tintColor(Color color, double factor) => Color.fromRGBO(
      _tintValue(color.red, factor),
      _tintValue(color.green, factor),
      _tintValue(color.blue, factor),
      1);

  static int _shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  static Color shadeColor(Color color, double factor) => Color.fromRGBO(
      _shadeValue(color.red, factor),
      _shadeValue(color.green, factor),
      _shadeValue(color.blue, factor),
      1);
}
