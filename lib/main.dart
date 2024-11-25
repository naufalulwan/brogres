import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/app.dart';
import 'src/configs/locator_config.dart';
import 'src/core/splash/data/data.dart';
import 'src/global/global.dart';
import 'src/configs/stored_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocatorConfig().init();
  await StoredConfig.init();

  StoredConfig.openBox<SplashTokenDTO>(ShareString.a$initData).then((_) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black.withOpacity(0.5),
        systemNavigationBarDividerColor: ColorUtil().tertiaryBlack,
      ),
    );
    runApp(const App());
  });
}
