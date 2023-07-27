import 'package:ecom_app/router/page_config.dart';
import 'package:ecom_app/views/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');
  final GlobalKey<NavigatorState> _shellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'shell');

  GoRouter getAppRoutes() {
    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: productsListPageConfig.path,
      routes: [
        // Tab Screen on the root
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            return TabsScreen(child: child);
          },
          routes: [
            // Products Routes
            GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              name: productsListPageConfig.name,
              path: productsListPageConfig.path,
              pageBuilder: productsListPageConfig.builder,
              routes: [
                GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  name: productDetailPageConfig.name,
                  path: productDetailPageConfig.path,
                  pageBuilder: productDetailPageConfig.builder,
                )
              ],
            ),
            // Cart Routes
            GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              name: cartsListPageConfig.name,
              path: cartsListPageConfig.path,
              pageBuilder: cartsListPageConfig.builder,
              routes: [
                GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  name: cartDetailPageConfig.name,
                  path: cartDetailPageConfig.path,
                  pageBuilder: cartDetailPageConfig.builder,
                )
              ],
            ),
          ],
        ),
        // Wishlist page route
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          name: wishListPageConfig.name,
          path: wishListPageConfig.path,
          pageBuilder: wishListPageConfig.builder,
        )
      ],
    );
  }
}
