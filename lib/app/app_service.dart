import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'coordinator.dart';

class AppService {
  static GlobalKey get navigatorKey => AppCoordinator.navigatorKey;

  Future<void> openDialog(Widget widget, bool barrierDismissible) async {
    showDialog(context: navigatorKey.currentState!.context, builder: (_) => widget, barrierDismissible: barrierDismissible);
  }

  void pushReplacement(String path) {
    navigatorKey.currentState!.context.pushReplacement(path);
  }

  // Future logoutService({
  //   required Function onLogout,
  // }) async {
  //   WoltModalSheet.show(
  //     context: navigatorKey.currentState!.context,
  //     modalTypeBuilder: (context) {
  //       return WoltModalType.dialog;
  //     },
  //     barrierDismissible: false,
  //     useRootNavigator: false,
  //     pageListBuilder: (context) {
  //       return [
  //         WoltModalSheetPage(
  //           topBarTitle: Text(
  //             'Đăng xuất',
  //             style: AIOxTextStyles.aIOHeadingMobileHeadingLG,
  //           ),
  //           // pageTitle: Padding(
  //           //   padding: const EdgeInsets.all(16.0),
  //           //   child: Text(
  //           //     'Phiên đăng nhập của bạn đã hết hạn. Vui lòng đăng nhập lại để sử dụng',
  //           //     style: AIOxTextStyles.bodyText16.copyWith(
  //           //       color: AIOxColors.textBody,
  //           //     ),
  //           //   ),
  //           // ),
  //           isTopBarLayerAlwaysVisible: true,
  //           child: Padding(
  //             padding: const EdgeInsets.all(16.0),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.stretch,
  //               children: [
  //                 MyAssets.icons.setting.circleWarning.svg(),
  //                 const Gap(16),
  //                 Text(
  //                   'Phiên đăng nhập của bạn đã hết hạn. Vui lòng đăng nhập lại để sử dụng',
  //                   style: AIOxTextStyles.bodyText16.copyWith(
  //                     color: AIOxColors.textBody,
  //                   ),
  //                 ),
  //                 const Gap(16),
  //                 AIOxPrimaryButton(
  //                   label: 'Đăng xuất',
  //                   onPressed: () {
  //                     onLogout();
  //                   },
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ];
  //     },
  //   );
  // }
}