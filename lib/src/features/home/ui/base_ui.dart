import 'package:flutter/material.dart';

import '../../../global/global.dart';

class BaseUi extends StatelessWidget {
  const BaseUi({super.key, required this.child});

  final Widget child;

  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        drawer: const Drawer(
          child: DrawerWidget(),
        ),
        appBar: appbarWidget(context,
            backgroundColor: ColorHelper.secondaryVanilla,
            useLeading: true,
            useAction: true,
            leadingIcon: Icons.menu,
            actionIcon: Icons.search, onTapLeading: () {
          scaffoldKey.currentState?.openDrawer();
        }, onTapAction: () {}),
        bottomNavigationBar: bottomNavigatorWidget(context),
        body: child);
  }
}
