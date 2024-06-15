import 'package:base/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../generated/assets.gen.dart';
import '../component/bottom_nav_bar.dart';
import '../provider/root_provider.dart';

class RootPage extends StatefulHookConsumerWidget {
  const RootPage({super.key});

  @override
  ConsumerState<RootPage> createState() => _RootPageState();
}

class _RootPageState extends ConsumerState<RootPage> {
  @override
  Widget build(BuildContext context) {
    DateTime? currentBackPressTime;
    var pageController = ref.watch(rootPageControllerProvider);

    var canPop = ref.watch(rootIndexProvider) == 0;

    return PopScope(
      canPop: canPop,
      onPopInvoked: (didPop) {
        if (didPop) {
          DateTime now = DateTime.now();
          if (currentBackPressTime == null || now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
            currentBackPressTime = now;
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Bấm lần nữa để thoát'),
              ),
            );
          }
        } else {
          ref.read(rootIndexProvider.notifier).update(
                (state) => 0,
          );
          pageController.jumpToPage(
            0,
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (value) => ref.read(rootIndexProvider.notifier).update((state) => value),
          children:  [
            Container(),
            Container(),
            Container(),
            Container(),
          ],
        ),
        bottomNavigationBar: BottomNavBar(
          items: [
            BottomNavigationBarItem(
              icon: iconNav(child: MyAssets.icons.home.svg()),
              activeIcon: iconNav(child: MyAssets.icons.homeActive.svg()),
              label: context.l10n.warehouse,
            ),
            // BottomNavigationBarItem(
            //   icon: iconNav(child: MyAssets.icons.asset.svg()),
            //   activeIcon: iconNav(child: MyAssets.icons.assetActive.svg()),
            //   label: context.l10n.asset,
            // ),
            // BottomNavigationBarItem(
            //   icon: iconNav(child: MyAssets.icons.notification.svg()),
            //   activeIcon: iconNav(child: MyAssets.icons.notification.svg()),
            //   label: context.l10n.notification,
            // ),
            BottomNavigationBarItem(
              icon: iconNav(child: MyAssets.icons.profile.svg()),
              activeIcon: iconNav(child: MyAssets.icons.profileActive.svg()),
              label: context.l10n.profile,
            ),
          ],
          currentIndex: ref.watch(rootIndexProvider),
          onTap: (index) {
            if (index != ref.watch(rootIndexProvider)) {
              ref.read(rootIndexProvider.notifier).update((state) => index);
            } else {
              switch (index) {
                case 0:
                  // if (ref.watch(homePageControllerProvider).hasClients) {
                  //   ref.watch(homePageControllerProvider).animateTo(
                  //     0.0,
                  //     duration: const Duration(milliseconds: 600),
                  //     curve: Curves.easeOut,
                  //   );
                  // }
                  break;
                case 1:
                // if (ref.watch(shopControllerProvider).hasClients) {
                //   ref.watch(shopControllerProvider).animateTo(
                //         0.0,
                //         duration: const Duration(milliseconds: 600),
                //         curve: Curves.easeOut,
                //       );
                // }
                  break;
                case 2:
                  break;
              }
            }
            pageController.jumpToPage(index);
          },
        ),
      ),
    );
  }
}

Widget iconNav({required Widget child}) => Container(
  padding: const EdgeInsets.only(bottom: 3),
  child: child,
);

