import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'builder_helper.dart';

class ShellRouteHelper<T extends GetxController> extends ShellRoute {
  final Widget Function(BuildContext, GoRouterState, Widget) shellBuilder;
  final bool autoRemove;
  final Bindings? binding;

  ShellRouteHelper(
      {required this.shellBuilder,
      this.binding,
      this.autoRemove = false,
      super.navigatorKey,
      required super.routes,
      super.observers,
      super.restorationScopeId})
      : super(
          builder: (c, s, w) => BuilderHelper<T>(
            autoRemove: autoRemove,
            initState: (_) {},
            dispose: (_) {},
            binding: binding,
            builder: (_) => shellBuilder(c, s, w),
          ),
        );
}
