import 'package:ecom_app/views/cart/cart_detail_screen.dart';
import 'package:ecom_app/views/cart/list_cart_screen.dart';
import 'package:ecom_app/views/home/list_products_screen.dart';
import 'package:ecom_app/views/home/products_detail_screen.dart';
import 'package:ecom_app/views/tabs_screen.dart';
import 'package:ecom_app/views/wishlist/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PageConfig {
  String name;
  String path;
  Page<dynamic> Function(BuildContext, GoRouterState)? builder;
  Page<dynamic> Function(BuildContext, GoRouterState, Widget)?
      shellRouterBuilder;

  PageConfig({
    required this.name,
    required this.path,
    this.builder,
    this.shellRouterBuilder,
  });
}

final tabsPageConfig = PageConfig(
  name: 'tabs',
  path: '/',
  shellRouterBuilder: (_, __, child) {
    return NoTransitionPage(child: TabsScreen(child: child));
  },
);

final productsListPageConfig = PageConfig(
  name: 'products',
  path: '/products',
  builder: (context, state) {
    return const NoTransitionPage(child: ProductsListScreen());
  },
);

final productDetailPageConfig = PageConfig(
  name: 'product-detail',
  path: 'product-detail/:id',
  builder: (p0, p1) {
    return CustomTransitionPage(
      transitionDuration: const Duration(milliseconds: 200),
      reverseTransitionDuration: const Duration(milliseconds: 200),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(1.0, 0.0),
            end: const Offset(0.0, 0.0),
          ).animate(animation),
          child: child,
        );
      },
      child: ProductDetailScreen(productId: p1.params['id']!),
    );
  },
);

final cartsListPageConfig = PageConfig(
  name: 'carts',
  path: '/carts',
  builder: (p0, p1) {
    return const NoTransitionPage(child: CartListScreen());
  },
);

final cartDetailPageConfig = PageConfig(
  name: 'cart-detail',
  path: 'cart-detail/:id',
  builder: (p0, p1) {
    return CustomTransitionPage(
      transitionDuration: const Duration(milliseconds: 200),
      reverseTransitionDuration: const Duration(milliseconds: 200),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(1.0, 0.0),
            end: const Offset(0.0, 0.0),
          ).animate(animation),
          child: child,
        );
      },
      child: CartDetailScreen(
        cartId: p1.params['id']!,
      ),
    );
  },
);

final wishListPageConfig = PageConfig(
  name: 'wishlist',
  path: '/wishlist',
  builder: (p0, p1) {
    return CustomTransitionPage(
      transitionDuration: const Duration(milliseconds: 200),
      reverseTransitionDuration: const Duration(milliseconds: 200),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(-1.0, 0.0),
            end: const Offset(0.0, 0.0),
          ).animate(animation),
          child: child,
        );
      },
      child: const WishListScreen(),
    );
  },
);
