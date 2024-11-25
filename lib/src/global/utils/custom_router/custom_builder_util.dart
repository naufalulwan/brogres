import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

import '../../global.dart';

mixin GetStateUpdaterMixins<T extends StatefulWidget> on State<T> {
  void getUpdate() {
    if (mounted) {
      setState(() {});
    }
  }
}

typedef GetControllerBuilder<T extends DisposableInterface> = Widget Function(
    T controller);

class CustomBuilderUtil<T extends GetxController> extends StatefulWidget {
  final GetControllerBuilder builder;
  final bool global;
  final Object? id;
  final String? tag;
  final bool autoRemove;
  final bool assignId;
  final Bindings? binding;
  final Object Function(T value)? filter;
  final void Function(BindBuilderState<T> state)? initState,
      dispose,
      didChangeDependencies;
  final void Function(CustomBuilderUtil oldWidget, BindBuilderState<T> state)?
      didUpdateWidget;
  final T? init;
  final void Function(BuildContext context, T controller)? on;

  const CustomBuilderUtil(
      {super.key,
      this.init,
      this.global = true,
      required this.builder,
      this.autoRemove = false,
      this.assignId = false,
      this.initState,
      this.filter,
      this.tag,
      this.dispose,
      this.id,
      this.didChangeDependencies,
      this.didUpdateWidget,
      this.binding,
      this.on});
  @override
  BindBuilderState<T> createState() => BindBuilderState<T>();
}

class BindBuilderState<T extends GetxController>
    extends State<CustomBuilderUtil<T>> with GetStateUpdaterMixins {
  T? controller;
  bool? _isCreator = false;
  VoidCallback? _remove;
  Object? _filter;

  @override
  void initState() {
    super.initState();

    widget.initState?.call(this);

    widget.binding?.dependencies();
    var isRegistered = GetInstance().isRegistered<T>(tag: widget.tag);

    if (widget.global) {
      if (isRegistered) {
        if (GetInstance().isPrepared<T>(tag: widget.tag)) {
          _isCreator = true;
        } else {
          _isCreator = false;
        }

        controller = GetInstance().find<T>(tag: widget.tag);
        if (isRegistered) {
          PrintUtil.logInfo(
            "$T: Dependencies Injected",
          );

          widget.on?.call(context, controller!);
        }
      } else {
        _isCreator = true;
        throw "Please binding_router with Get.put($T()) or Get.lazyPut<$T>(()=>$T())";
      }
    } else {
      controller = widget.init;
      _isCreator = true;
      controller?.onStart();
    }
    _subscribeToController();
  }

  void _subscribeToController() {
    _remove?.call();
    _remove = (widget.id == null)
        ? controller?.addListener(
            _filter != null ? _filterUpdate : getUpdate,
          )
        : controller?.addListenerId(
            widget.id,
            _filter != null ? _filterUpdate : getUpdate,
          );
  }

  void _filterUpdate() {
    var newFilter = widget.filter!(controller!);
    if (newFilter != _filter) {
      _filter = newFilter;
      getUpdate();
    }
  }

  @override
  void dispose() {
    super.dispose();

    widget.dispose?.call(this);
    this.controller?.onDelete.call();
    if (_isCreator! || widget.assignId) {
      if (widget.autoRemove && GetInstance().isRegistered<T>(tag: widget.tag)) {
        GetInstance().delete<T>(tag: widget.tag);
      }
    }
    // _remove?.call();

    controller = null;
    _isCreator = null;
    _remove = null;
    _filter = null;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.didChangeDependencies?.call(this);
  }

  @override
  void didUpdateWidget(CustomBuilderUtil oldWidget) {
    super.didUpdateWidget(oldWidget as CustomBuilderUtil<T>);
    if (oldWidget.id != widget.id) {
      _subscribeToController();
    }
    widget.didUpdateWidget?.call(oldWidget, this);
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(controller!);
  }
}
