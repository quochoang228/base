import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WillPopScopeRoute extends StatefulWidget {
  const WillPopScopeRoute({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<WillPopScopeRoute> createState() => _WillPopScopeRouteState();
}

class _WillPopScopeRouteState extends State<WillPopScopeRoute> {
  DateTime? lastPressedAt; //上次点击时间

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) return;
        // SmartDialog.showToast(S.of(context).widgets_will_pop_scope_route_toast);
        if (lastPressedAt == null ||
            DateTime.now().difference(lastPressedAt!) >
                const Duration(seconds: 1)) {
          // If the interval between two clicks exceeds 1 second, the timer will be reset.
          lastPressedAt = DateTime.now();
          return;
        }
        context.pop();
      },
      child: widget.child,
    );
  }
}