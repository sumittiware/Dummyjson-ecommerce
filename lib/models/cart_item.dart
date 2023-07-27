import 'package:json_annotation/json_annotation.dart';
import 'cart_product.dart';

part 'cart_item.g.dart';

@JsonSerializable()
class CartItem {
  int id;
  List<CartProduct> products;
  double total;
  double discountedTotal;
  int userId;
  int totalProducts;
  int totalQuantity;

  CartItem({
    required this.id,
    required this.products,
    required this.total,
    required this.discountedTotal,
    required this.userId,
    required this.totalProducts,
    required this.totalQuantity,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemToJson(this);
}
