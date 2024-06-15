import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'init.dart';
import 'widgets/will_pop_scope_route/will_pop_scope_route.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return ScreenUtilInit(
          builder: (context, child) {
            return MaterialApp(
              // 网格
              debugShowMaterialGrid: false,
              // Debug标志
              debugShowCheckedModeBanner: false,
              // 打开性能监控，覆盖在屏幕最上面
              showPerformanceOverlay: false,
              // 语义视图（无障碍）
              showSemanticsDebugger: false,

              home: const WillPopScopeRoute(
                child: Init(
                  child: MenuPage(key: Key('widget_menu_page')),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

/// 外层抽屉菜单
class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final drawerController = ZoomDrawerController();

    return ZoomDrawer(
      controller: drawerController,
      menuScreen: Container(),
      mainScreen: const MainScreenBody(),
      borderRadius: 36.w,
      showShadow: true,
      disableDragGesture: false,
      mainScreenTapClose: true,
      openCurve: Curves.easeOut,
      closeCurve: Curves.fastOutSlowIn,
      // drawerShadowsBackgroundColor:
      //     isDarkMode(context) ? Colors.black26 : Colors.white38,
      // menuBackgroundColor: isDarkMode(context)
      //     ? Theme.of(context).primaryColor.withAlpha(155)
      //     : Theme.of(context).primaryColor,
      angle: 0,
      mainScreenScale: 0.3,
      slideWidth: MediaQuery.of(context).size.width * 0.70,
      style: DrawerStyle.defaultStyle,
    );
  }
}

/// 主屏幕逻辑
class MainScreenBody extends StatelessWidget {
  const MainScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    /// 监听状态进行改变
    return ValueListenableBuilder<DrawerState>(
      valueListenable: ZoomDrawer.of(context)!.stateNotifier,
      builder: (_, state, child) {
        print('外层菜单状态：$state');
        return AbsorbPointer(
          absorbing: state != DrawerState.closed,
          child: child,
        );
      },
      child: Container(),
    );
  }
}

