import 'package:flutter/material.dart';

class ShadowUtil {
  static BoxShadow boxButton() {
    return BoxShadow(
      color: Colors.black.withOpacity(0.1),
      spreadRadius: 0,
      blurRadius: 9,
      offset: const Offset(5, 7),
    );
  }

  static BoxShadow boxGlobal() {
    return BoxShadow(
      color: Colors.black.withOpacity(0.25),
      spreadRadius: 0,
      blurRadius: 4,
      offset: const Offset(0, 4),
    );
  }

  static BoxShadow boxContainer({double? x, double? y}) {
    return BoxShadow(
      color: Colors.black.withOpacity(0.15),
      spreadRadius: 0,
      blurRadius: 15,
      offset: Offset(x ?? 0, y ?? 0),
    );
  }
}
