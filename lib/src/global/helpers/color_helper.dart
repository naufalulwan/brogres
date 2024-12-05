import 'dart:math';

import 'package:brogres/src/global/global.dart';
import 'package:flutter/material.dart';

class ColorHelper {
  static Color primaryOrange = _colorFromHex("FFBA22");
  static Color secondaryVanilla = _colorFromHex("FFDE97");
  static Color tertiaryBlack = _colorFromHex("372F2F");
  static Color touchesBlue = _colorFromHex("003CFF");
  static Color paymentGreen = _colorFromHex("8DFF22");
  static Color errorRed = _colorFromHex("AF1740");
  static Color disabledAnthracite = _colorFromHex("404258");

  const ColorHelper._();

  static Color color(String hexValue) => _colorFromHex(hexValue);

  static Color _colorFromHex(String hexValue) {
    if (hexValue.startsWith('#')) {
      hexValue = hexValue.replaceAll("#", "");
    }
    if (hexValue.length == 6) {
      hexValue = "FF$hexValue";
    }
    try {
      return Color(int.parse("0x$hexValue"));
    } catch (e) {
      throw ExceptionHelper("Invalid hex color value: $hexValue");
    }
  }

  static MaterialColor materialColor(String hexValue) {
    Color value = _colorFromHex(hexValue);

    return MaterialColor(value.value, {
      50: _tintColor(value, 0.9),
      100: _tintColor(value, 0.8),
      200: _tintColor(value, 0.6),
      300: _tintColor(value, 0.4),
      400: _tintColor(value, 0.2),
      500: value,
      600: _shadeColor(value, 0.1),
      700: _shadeColor(value, 0.2),
      800: _shadeColor(value, 0.3),
      900: _shadeColor(value, 0.4),
    });
  }

  static int _tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));
  static Color _tintColor(Color color, double factor) => Color.fromRGBO(
      _tintValue(color.red, factor),
      _tintValue(color.green, factor),
      _tintValue(color.blue, factor),
      1);
  static int _shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));
  static Color _shadeColor(Color color, double factor) => Color.fromRGBO(
      _shadeValue(color.red, factor),
      _shadeValue(color.green, factor),
      _shadeValue(color.blue, factor),
      1);
}
