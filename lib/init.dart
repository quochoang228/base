import 'package:base/logs/log_utils.dart';
import 'package:flutter/widgets.dart';

class Init extends StatefulWidget {
  const Init({super.key, required this.child});

  final Widget child;

  @override
  State<Init> createState() => _InitState();
}

class _InitState extends State<Init> {
  late final AppLifecycleListener _appLifecycleListener;

  @override
  void initState() {
    super.initState();

    /// App 生命周期
    _appLifecycleListener = AppLifecycleListener(
      onResume: () => LogUtils.i('App Resume'),
      onInactive: () => LogUtils.i('App Inactive'),
      onHide: () => LogUtils.i('App Hide'),
      onShow: () => LogUtils.i('App Show'),
      onPause: () {
        LogUtils.i('App Pause');
        // runLockScreen();
      },
      onRestart: () => LogUtils.i('App Restart'),
      onDetach: () => LogUtils.i('App Detach'),
    );

    /// 初始化
    WidgetsBinding.instance.endOfFrame.then((_) {
      if (mounted) init();
    });
  }

  @override
  void dispose() {
    _appLifecycleListener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
       return widget.child;
  }

  void init() async {
    // final MoodProvider moodProvider = context.read<MoodProvider>();
    // final ApplicationProvider applicationProvider =
    //     context.read<ApplicationProvider>();

    // // 初始化数据库
    // await DB.db.database;
    // // 锁屏
    // runLockScreen();
    // // 获取所有心情类别
    // moodProvider.loadMoodCategoryAllList();
    // // 触发获取APP主题深色模式
    // applicationProvider.loadThemeMode();
    // // 触发获取APP多主题模式
    // applicationProvider.loadMultipleThemesMode();
    // // 触发获取APP地区语言
    // applicationProvider.loadLocale();
    // // 触发获取APP地区语言是否跟随系统
    // applicationProvider.loadLocaleSystem();
    // // 通知权限判断显示
    // allowedNotification();

    // /// 通知测试
    // NotificationController.cancelNotifications();
    // sendNotification();
    // sendScheduleNotification();
  }
}
