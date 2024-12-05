import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

String _infoIcon = '💬';
String _warningIcon = '💡';
String _errorIcon = '🚨';
String _systemIcon = '📱';
String _routeIcon = '🚀';
String _exceptionIcon = '💣';

enum PrintType {
  basic,
  route,
  exception,
}

class PrintHelper {
  PrintHelper(String messages) {
    var date =
        "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";
    if (kDebugMode) {
      _printer(
          '\x1B[40m\x1B[1m\x1B[36m\x1B[36m($date)\x1B[0m \x1B[1m$messages\x1B[0m');
    }
  }

  static void logSystem(String messages, {PrintType type = PrintType.basic}) {
    var date =
        "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";

    if (type == PrintType.basic) {
      _printer(
          '\x1b[48;2;102;0;102m\x1b[38;5;231m($date)\x1B[0m $_systemIcon \x1B[1m\x1b[38;5;85m$messages\x1B[0m');
    } else if (type == PrintType.route) {
      _printer(
          '\x1B[48;2;34;23;122m\x1B[38;2;230;233;175m($date)\x1B[0m $_routeIcon \x1B[1m\x1b[38;5;230m$messages\x1B[0m');
    } else if (type == PrintType.exception) {
      _printer(
          '\x1B[48;2;255;69;69m\x1b[38;2;255;246;277m($date)\x1B[0m $_exceptionIcon \x1B[1m\x1b[38;5;198m$messages\x1B[0m');
    }
  }

  static void logInfo(dynamic messages) {
    var date =
        "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";
    if (kDebugMode) {
      _printer(
          '\x1B[40m\x1B[1m\x1B[36m($date)\x1B[0m $_infoIcon \x1B[1m\x1B[34m$messages\x1B[0m');
    }
  }

  static void logWarning(dynamic messages) {
    var date =
        "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";
    if (kDebugMode) {
      _printer(
          '\x1B[40m\x1B[1m\x1B[36m($date)\x1B[0m $_warningIcon \x1B[1m\x1B[33m$messages\x1B[0m');
    }
  }

  static void logError(dynamic messages) {
    var date =
        "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";
    if (kDebugMode) {
      _printer(
          '\x1B[40m\x1B[1m\x1B[36m($date)\x1B[0m $_errorIcon \x1B[1m\x1B[35m$messages\x1B[0m');
    }
  }
}

class _RichStyle {
  final Color? foreground;
  final Color? background;
  final bool italic;
  final bool bold;
  final bool underline;

  ///Rarely supported feature
  final bool slowBlink;

  ///Rarely supported feature
  final bool rapidBlink;
  final bool invert;

  ///Rarely supported feature
  final bool conceal;
  final bool strike;

  ///Rarely supported feature
  final bool gothic;
  final bool doubleUnderline;
  final bool framed;
  final bool encircled;
  final bool overLined;

  ///Rarely supported feature
  final Color? underlineColor;

  _RichStyle({
    this.background,
    this.foreground,
    this.italic = false,
    this.bold = false,
    this.underline = false,
    this.slowBlink = false,
    this.rapidBlink = false,
    this.invert = false,
    this.conceal = false,
    this.strike = false,
    this.gothic = false,
    this.doubleUnderline = false,
    this.framed = false,
    this.encircled = false,
    this.overLined = false,
    this.underlineColor,
  });

  List<String> get codes => [
        italicCode,
        invertCode,
        concealCode,
        strikeCode,
        gothicCode,
        doubleUnderlineCode,
        framedCode,
        encircledCode,
        overlinedCode,
        boldCode,
        slowBlinkCode,
        rapidBlinkCode,
        underlineCode,
        underlineColorCode,
        foregroundCode,
        backgroundCode
      ];

  _RichStyle copyWith(
      {Color? foreground,
      Color? background,
      bool? italic,
      bool? bold,
      bool? underline,
      bool? slowBlink,
      bool? rapidBlink,
      bool? invert,
      bool? conceal,
      bool? strike,
      bool? gothic,
      bool? doubleUnderline,
      bool? framed,
      bool? encircled,
      bool? overLined,
      Color? underlineColor}) {
    return _RichStyle(
      foreground: foreground ?? this.foreground,
      background: background ?? this.background,
      italic: italic ?? this.italic,
      bold: bold ?? this.bold,
      underline: underline ?? this.underline,
      slowBlink: slowBlink ?? this.slowBlink,
      rapidBlink: rapidBlink ?? this.rapidBlink,
      invert: invert ?? this.invert,
      conceal: conceal ?? this.conceal,
      strike: strike ?? this.strike,
      gothic: gothic ?? this.gothic,
      doubleUnderline: doubleUnderline ?? this.doubleUnderline,
      framed: framed ?? this.framed,
      encircled: encircled ?? this.encircled,
      overLined: overLined ?? this.overLined,
      underlineColor: underlineColor ?? this.underlineColor,
    );
  }

  String applyTo(String text) {
    final joined = codes.join('');
    //removes last ":"
    final appliedCodes = joined.substring(0, joined.length - 1);
    return "\u{1B}["
        "$appliedCodes"
        "m"
        "$text"
        "\u{1B}[0m";
  }

  String get backgroundCode => background != null
      ? "48:2:${background!.red}:${background!.green}:${background!.blue}:"
      : "49:";

  String get foregroundCode => foreground != null
      ? "38:2:${foreground!.red}:${foreground!.green}:${foreground!.blue}:"
      : "39:";

  String get boldCode => bold ? "1:" : "";

  String get italicCode => italic ? "3:" : "";

  String get underlineCode => underline ? "4:" : "";

  String get slowBlinkCode => slowBlink ? "5:" : "";

  String get rapidBlinkCode => rapidBlink ? "6:" : "";

  String get invertCode => invert ? "7:" : "";

  String get concealCode => conceal ? "8:" : "";

  String get strikeCode => strike ? "9:" : "";

  String get gothicCode => gothic ? "20:" : "";

  String get doubleUnderlineCode => doubleUnderline ? "21:" : "";

  String get framedCode => framed ? "51:" : "";

  String get encircledCode => encircled ? "52:" : "";

  String get overlinedCode => overLined ? "53:" : "";

  String get underlineColorCode => underlineColor != null
      ? "53:2:${underlineColor!.red}:${underlineColor!.green}:${underlineColor!.blue}"
      : "";
}

void _printer(
  Object? object, {
  bool printToConsole = kDebugMode,
  Color? foreground,
  Color? background,
  bool italic = false,
  bool bold = false,
  bool underline = false,
  bool slowBlink = false,
  bool rapidBlink = false,
  bool invert = false,
  bool conceal = false,
  bool strike = false,
  bool gothic = false,
  bool doubleUnderline = false,
  bool framed = false,
  bool encircled = false,
  bool overlined = false,
  bool timestamp = false,
  DateTime? startTime,
  DateFormat? timeFormatter,
  Color? underlineColor,
  _RichStyle? style,
}) {
  // * Time stamp
  String stringTime = "";
  final time = DateTime.now();
  if (timestamp) {
    if (startTime == null) {
      final formatter = timeFormatter ?? DateFormat('hh:mm:ss');
      stringTime = "${formatter.format(time)} | ";
    } else {
      stringTime = "${time.difference(startTime)} | ";
    }
  }

  // * print style
  final printStyle = (style ?? _RichStyle()).copyWith(
    foreground: foreground,
    background: background,
    italic: italic,
    bold: bold,
    underline: underline,
    slowBlink: slowBlink,
    rapidBlink: rapidBlink,
    invert: invert,
    conceal: conceal,
    strike: strike,
    gothic: gothic,
    doubleUnderline: doubleUnderline,
    framed: framed,
    encircled: encircled,
    overLined: overlined,
    underlineColor: underlineColor,
  );

  if (printToConsole) {
    if (kDebugMode) {
      print(stringTime + printStyle.applyTo(object.toString()));
    }
  }
}
