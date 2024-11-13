import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';

class HiveSetting {
  static void init(Directory dir) {
    Hive.init(dir.path);
  }
}
