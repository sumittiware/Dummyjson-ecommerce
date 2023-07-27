import 'package:ecom_app/view_models/products_view_model.dart';
import 'package:ecom_app/views/base/base_view.dart';
import 'package:ecom_app/views/home/widgets/product_card.dart';
import 'package:flutter/material.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ProductsViewModel>(
      builder: (_, productViewModel, __) {
        final favProducts = productViewModel.favouriteProducts;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Wishlist'),
          ),
          body: ListView.builder(
            itemBuilder: (context, index) {
              return ProductCard(
                product: favProducts[index],
              );
            },
            itemCount: favProducts.length,
          ),
        );
      },
    );
  }
}
