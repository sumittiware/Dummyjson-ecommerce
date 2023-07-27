import 'dart:io';

import 'package:ecom_app/models/cart_item.dart';
import 'package:ecom_app/services/base/api_request_service.dart';

class CartServices {
  final _apiService = PaginatedApiService(endPoint: "carts");

  Future<List<CartItem>> get() async {
    try {
      final cartResponse = await _apiService.get("carts");

      final cartItems = cartResponse.items
          .map(
            (c) => CartItem.fromJson(c),
          )
          .toList();
      return cartItems;
    } on HttpException catch (_) {
      rethrow;
    }
  }
}
