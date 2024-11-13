import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import 'src/app.dart';
import 'src/core/settings/hive_setting.dart';
import 'src/core/settings/locator_setting.dart';
import 'src/core/utils/color_util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  locatorSetting();

  final dir = await getApplicationDocumentsDirectory();
  HiveSetting.init(dir);

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black.withOpacity(0.5),
      systemNavigationBarDividerColor: ColorUtil().tertiaryBlack,
    ),
  );
  runApp(const App());
}
