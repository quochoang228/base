import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../app/coordinator.dart';
import '../feature/root/ui/page/root_page.dart';
import '../feature/splash/ui/page/splash_page.dart';
import 'paths.dart';

final goRouterConfiguration = GoRouter(
  initialLocation: Paths.splash,
  debugLogDiagnostics: false,
  redirect: _guard,
  navigatorKey: AppCoordinator.navigatorKey,
  routes: [
    ///========== start =========//
    GoRoute(
      path: Paths.splash,
      builder: (context, state) => const SplashPage(),
    ),

    GoRoute(
      path: Paths.root,
      builder: (context, state) => const RootPage(),
    ),
  ],
);

String? _guard(BuildContext context, GoRouterState state) {
  // final bool signedIn = _auth.signedIn;
  // final bool signingIn = state.subloc == '/signin';

  // // Go to /signin if the user is not signed in
  // if (!signedIn && !signingIn) {
  //   return '/signin';
  // }
  // // Go to /books if the user is signed in and tries to go to /signin.
  // else if (signedIn && signingIn) {
  //   return '/books';
  // }

  // no redirect
  return null;
}

// Add animation transition page
class FadeTransitionPage extends CustomTransitionPage<void> {
  /// Creates a [FadeTransitionPage].
  FadeTransitionPage({
    required LocalKey super.key,
    required super.child,
  }) : super(
            transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) =>
                FadeTransition(
                  opacity: animation.drive(_curveTween),
                  child: child,
                ));

  static final CurveTween _curveTween = CurveTween(curve: Curves.easeIn);
}
