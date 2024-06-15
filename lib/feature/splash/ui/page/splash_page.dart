import 'dart:async';

import 'package:base_ui/base_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../generated/assets.gen.dart';
import '../../../../router/paths.dart';
class SplashPage extends StatefulHookConsumerWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  double percent = 0.0;
  Timer? timer;
  int _start = 1;
  final int _totalTime = 1;

  @override
  void initState() {
    super.initState();
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            getLocalUser();
          });
        } else {
          setState(() {
            _start--;
            percent = 1 - _start / _totalTime;
          });
        }
      },
    );
  }

  getLocalUser() async {
    // await ref.read(localUserProvider.notifier).fetchLocalUser();
    checkAuth();
  }

  void checkAuth() {
    // final localUser = ref.watch(localUserProvider);
    // if ((localUser.email ?? '').isEmpty) {
    //   context.pushReplacement(Paths.login);
    // } else {
    //   context.pushReplacement(Paths.root);
    // }
      context.pushReplacement(Paths.root);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.backgroundWhite,
      body: Center(
        child: Hero(
          tag: 'logo',
          child: MyAssets.images.logo.image(
              width: context.mqSize.width * 0.55,
              height: context.mqSize.width * 0.55),
        ),
        // child: Text(
        //   context.l10n.appName,
        //   style: BaseStyle.headlineLarge.applyColor(
        //     CoreColors.white,
        //   ),
        // ),
      ),
    );
  }
}
