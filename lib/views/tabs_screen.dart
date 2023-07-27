import 'package:ecom_app/router/page_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../router/custom_navbar_item.dart';

class TabsScreen extends StatefulWidget {
  final Widget child;
  const TabsScreen({
    super.key,
    required this.child,
  });

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final tabs = [
    CustomNavBarTabItem(
      icon: const Icon(Icons.home_rounded),
      label: 'Products',
      initialLocation: productsListPageConfig.path,
    ),
    CustomNavBarTabItem(
      icon: const Icon(Icons.shopping_bag_rounded),
      label: 'Cart',
      initialLocation: cartsListPageConfig.path,
    ),
  ];

  void _onItemTap(int tabIndex) {
    context.go(tabs[tabIndex].initialLocation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getTitle(context)),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border_rounded),
            onPressed: () {
              context.push(wishListPageConfig.path);
            },
          )
        ],
      ),
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _calculateSelectedIndex(context),
        onTap: _onItemTap,
        items: tabs,
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith(productsListPageConfig.path)) {
      return 0;
    }
    if (location.startsWith(cartsListPageConfig.path)) {
      return 1;
    }
    return 0;
  }

  static String _getTitle(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith(productsListPageConfig.path)) {
      return "Products";
    }
    if (location.startsWith(cartsListPageConfig.path)) {
      return "Cart";
    }
    return "Products";
  }
}
