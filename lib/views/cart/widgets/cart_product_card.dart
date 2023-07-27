import 'package:ecom_app/models/cart_product.dart';
import 'package:flutter/material.dart';

class CartProductCard extends StatelessWidget {
  final CartProduct cartProduct;

  const CartProductCard({
    super.key,
    required this.cartProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 8,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(cartProduct.title),
            Row(
              children: [
                Text("\$${cartProduct.price} x${cartProduct.quantity}"),
                const Spacer(),
                Text("\$${cartProduct.total}"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
