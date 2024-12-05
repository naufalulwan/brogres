// ignore_for_file: overridden_fields
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'builder_helper.dart';

typedef PageBuilderCallback = CustomTransitionPage Function(
    BuildContext, GoRouterState);

class RouteHelper<T extends GetxController> extends GoRoute {
  final GoRouterWidgetBuilder? builderWidget;

  final PageBuilderCallback? builderPage;
  final Bindings? binding;
  final void Function(BindBuilderState<T>)? initState;
  final bool autoRemove;

  RouteHelper(
      {this.initState,
      this.builderPage,
      this.builderWidget,
      this.autoRemove = false,
      required super.path,
      super.name,
      this.binding,
      super.parentNavigatorKey,
      super.redirect,
      super.routes = const <RouteBase>[]})
      : super(
            builder: builderWidget == null
                ? null
                : (BuildContext context, GoRouterState state) {
                    return BuilderHelper<T>(
                      autoRemove: autoRemove,
                      initState: initState,
                      dispose: (_) {},
                      binding: binding,
                      builder: (_) => builderWidget(context, state),
                    );
                  },
            pageBuilder: builderPage == null
                ? null
                : (BuildContext context, GoRouterState state) {
                    return CustomTransitionPage(
                        transitionDuration:
                            builderPage.call(context, state).transitionDuration,
                        arguments: builderPage.call(context, state).arguments,
                        barrierColor:
                            builderPage.call(context, state).barrierColor,
                        barrierDismissible:
                            builderPage.call(context, state).barrierDismissible,
                        barrierLabel:
                            builderPage.call(context, state).barrierLabel,
                        fullscreenDialog:
                            builderPage.call(context, state).fullscreenDialog,
                        key: builderPage.call(context, state).key,
                        maintainState:
                            builderPage.call(context, state).maintainState,
                        name: builderPage.call(context, state).name,
                        opaque: builderPage.call(context, state).opaque,
                        restorationId:
                            builderPage.call(context, state).restorationId,
                        reverseTransitionDuration: builderPage
                            .call(context, state)
                            .reverseTransitionDuration,
                        child: BuilderHelper<T>(
                          autoRemove: autoRemove,
                          initState: (_) {},
                          dispose: (_) {},
                          binding: binding,
                          builder: (_) =>
                              builderPage.call(context, state).child,
                        ),
                        transitionsBuilder: builderPage
                            .call(context, state)
                            .transitionsBuilder);
                  });
}
