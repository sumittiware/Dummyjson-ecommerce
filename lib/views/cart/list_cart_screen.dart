import 'package:ecom_app/models/cart_item.dart';
import 'package:ecom_app/view_models/cart_view_model.dart';
import 'package:ecom_app/views/base/base_view.dart';
import 'package:ecom_app/views/cart/widgets/cart_items_card.dart';
import 'package:ecom_app/widgets/paginated_listview.dart';
import 'package:flutter/material.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<CartViewModel>(
      onModelReady: (cartViewModel) => cartViewModel.loadCartItems(init: true),
      builder: (_, cartViewModel, __) {
        final cartItems = cartViewModel.cartItems;
        return Scaffold(
          body: (cartViewModel.isInitalizing)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : PaginatedListView<CartItem>(
                  complete: cartViewModel.fullDataLoaded,
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    return CartItemCard(
                      cartItem: cartItems[index],
                    );
                  },
                  onPageChanged: () async {
                    await cartViewModel.loadCartItems();
                  },
                ),
        );
      },
    );
  }
}
