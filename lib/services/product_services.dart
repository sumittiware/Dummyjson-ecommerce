import 'dart:io';

import 'package:ecom_app/models/product.dart';
import 'package:ecom_app/services/base/api_request_service.dart';

class ProductsServices {
  final _apiService = PaginatedApiService(endPoint: "products", limit: 10);

  Future<List<Product>> get() async {
    try {
      final productResponse = await _apiService.get("products");

      final productList = productResponse.items
          .map(
            (p) => Product.fromJson(p),
          )
          .toList();
      return productList;
    } on HttpException catch (_) {
      rethrow;
    }
  }
}
