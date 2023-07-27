import 'package:ecom_app/router/go_router.dart';
import 'package:ecom_app/view_models/cart_view_model.dart';
import 'package:ecom_app/view_models/products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ProductsViewModel>(create: (_) => ProductsViewModel()),
        Provider<CartViewModel>(create: (_) => CartViewModel()),
      ],
      child: MaterialApp.router(
        title: 'Dummy Ecommerce',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey.shade200,
        ),
        routerConfig: AppRouter().getAppRoutes(),
      ),
    );
  }
}
