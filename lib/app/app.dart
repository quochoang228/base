import 'package:base_ui/base_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../l10n/l10n.dart';
import '../router/router_config.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      // theme: lightThemeData,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: BaseColors.backgroundWhite,
          scrolledUnderElevation: 0.0,
        )
      ),
      builder: (context, child) {
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
          data: data.copyWith(
            textScaler: TextScaler.noScaling,
          ),
          child: child!,
        );
      },
      debugShowCheckedModeBanner: false,
      routerConfig: goRouterConfiguration,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
