import 'package:ecom_app/models/cart_item.dart';
import 'package:ecom_app/router/page_config.dart';
import 'package:ecom_app/view_models/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CartItemCard extends StatelessWidget {
  final CartItem cartItem;

  const CartItemCard({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CartViewModel>(builder: (_, cartViewModel, __) {
      return Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        child: InkWell(
          onTap: () {
            cartViewModel.setSelectedCart(cartItem.id);
            context.pushNamed(
              cartDetailPageConfig.name,
              params: {
                'id': '${cartItem.id}',
              },
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cart ${cartItem.id}',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "Total Products : ${cartItem.totalProducts} x ${cartItem.totalQuantity}",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Text(
                      'Total : ',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      ' \$${cartItem.discountedTotal} ',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                    ),
                    Text(
                      '\$${cartItem.total}',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.red,
                          ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "User : ${cartItem.userId}",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
