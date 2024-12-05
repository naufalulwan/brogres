import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'src/configs/app_config.dart';
import 'src/configs/locator_config.dart';
import 'src/global/global.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await StoredHelper.init();
  await LocatorConfig.init();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black.withOpacity(0.5),
      systemNavigationBarDividerColor: ColorHelper.tertiaryBlack,
    ),
  );
  runApp(const AppConfig());
}
