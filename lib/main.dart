import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/app.dart';
import 'src/core/settings/locator_setting.dart';
import 'src/core/utils/color_util.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  locatorSetting();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black.withOpacity(0.5),
      systemNavigationBarDividerColor: ColorUtil().tertiaryBlack,
    ),
  );
  runApp(const App());
}
