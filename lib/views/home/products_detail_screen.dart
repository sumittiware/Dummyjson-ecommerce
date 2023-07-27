import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom_app/models/product.dart';
import 'package:ecom_app/view_models/products_view_model.dart';
import 'package:ecom_app/views/base/base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailScreen extends StatefulWidget {
  final String productId;

  const ProductDetailScreen({
    super.key,
    required this.productId,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ProductsViewModel>(
      builder: (_, productViewModel, __) {
        final product = productViewModel.selectedProduct;
        final size = MediaQuery.of(context).size;
        return Scaffold(
          appBar: AppBar(
            title: Text(product.title),
            actions: [
              IconButton(
                icon: Icon(
                  (productViewModel.isFavourite(product.id))
                      ? Icons.favorite_rounded
                      : Icons.favorite_border_rounded,
                  color: Colors.pink,
                  size: 20,
                ),
                onPressed: () {
                  productViewModel.addFavorite(product.id);
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _productPageView(size.width, size.height, product),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              product.title,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          _buildCategory(product),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(product.brand),
                      const SizedBox(height: 10),
                      _ratingBar(context, product),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "\$${product.price}",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(width: 3),
                          Visibility(
                            visible:
                                product.discountPercentage != 0 ? true : false,
                            child: Text(
                              "${product.discountPercentage}% off",
                              style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            product.stock != 0
                                ? "Available in stock"
                                : "Not available",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: (product.stock != 0)
                                    ? Colors.green
                                    : Colors.red),
                          )
                        ],
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "About",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 10),
                      Text(product.description),
                      const SizedBox(height: 20),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _productPageView(double width, double height, Product product) {
    return Hero(
      tag: product.id,
      child: SizedBox(
        height: height * 0.42,
        width: width,
        child: CarouselSlider(
          items: product.images
              .map(
                (e) => Image.network(
                  e,
                  fit: BoxFit.cover,
                ),
              )
              .toList(),
          options: CarouselOptions(),
        ),
      ),
    );
  }

  Widget _ratingBar(BuildContext context, Product product) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        RatingBar.builder(
          initialRating: product.rating,
          glow: true,
          itemSize: 20,
          direction: Axis.horizontal,
          itemBuilder: (_, __) => const Icon(Icons.star, color: Colors.amber),
          onRatingUpdate: (_) {},
        ),
      ],
    );
  }

  Widget _buildCategory(Product product) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child: Text(product.category),
    );
  }
}
