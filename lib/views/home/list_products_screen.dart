import 'package:ecom_app/models/product.dart';
import 'package:ecom_app/view_models/products_view_model.dart';
import 'package:ecom_app/views/base/base_view.dart';
import 'package:ecom_app/views/home/widgets/product_card.dart';
import 'package:ecom_app/widgets/paginated_listview.dart';
import 'package:flutter/material.dart';

class ProductsListScreen extends StatefulWidget {
  const ProductsListScreen({super.key});

  @override
  State<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ProductsViewModel>(
      onModelReady: (viewModel) => viewModel.loadProducts(init: true),
      builder: (_, productsViewModel, __) {
        final products = productsViewModel.products;
        return Scaffold(
          body: (productsViewModel.isInitalizing)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : PaginatedListView<Product>(
                  complete: productsViewModel.fullDataLoaded,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      product: products[index],
                    );
                  },
                  onPageChanged: () async {
                    await productsViewModel.loadProducts();
                  },
                ),
        );
      },
    );
  }
}
