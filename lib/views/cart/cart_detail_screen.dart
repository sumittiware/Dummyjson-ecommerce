import 'package:ecom_app/view_models/cart_view_model.dart';
import 'package:ecom_app/views/base/base_view.dart';
import 'package:ecom_app/views/cart/widgets/cart_product_card.dart';
import 'package:flutter/material.dart';

class CartDetailScreen extends StatefulWidget {
  final String cartId;
  const CartDetailScreen({
    super.key,
    required this.cartId,
  });

  @override
  State<CartDetailScreen> createState() => _CartDetailScreenState();
}

class _CartDetailScreenState extends State<CartDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<CartViewModel>(
      builder: (_, cartViewModel, __) {
        final cartItem = cartViewModel.selectedCartItem;
        return Scaffold(
          appBar: AppBar(title: Text("Cart ${cartItem.id}")),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "User : ${cartItem.userId}",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Products",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Expanded(
                child: Column(children: [
                  ...cartItem.products
                      .map(
                        (product) => CartProductCard(
                          cartProduct: product,
                        ),
                      )
                      .toList(),
                ]),
              ),
              Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                )),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      _buildDetailItem(
                        'Total Products',
                        "${cartItem.totalProducts}",
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      _buildDetailItem(
                        'Total',
                        "\$${cartItem.total}",
                      ),
                      const SizedBox(
                        height: 32,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _buildDetailItem(String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const Spacer(),
        Text(
          value,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontSize: 16,
              ),
        ),
      ],
    );
  }
}
