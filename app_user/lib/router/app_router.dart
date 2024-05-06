import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../modules/auth/presentation/login_view.dart';
part 'app_routers.dart';
part 'not_found_screen.dart';

GoRouter goRouter() {
  final defaultLocation = AppRoutes.login.initLocation;
  const restorationScopeId = 'app_router';
  final rootNavigatorKey = GlobalKey<NavigatorState>();

  return GoRouter(
    initialLocation: defaultLocation,
    restorationScopeId: restorationScopeId,
    debugLogDiagnostics: true,
    navigatorKey: rootNavigatorKey,
    routes: [
      GoRoute(
        path: AppRoutes.login.initLocation,
        name: AppRoutes.login.name,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.notFound.initLocation,
        name: AppRoutes.notFound.name,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const NotFoundScreen(),
        ),
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
}

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SizeTransition(sizeFactor: animation, child: child);
    },
  );
}
