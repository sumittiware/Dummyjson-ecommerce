import 'package:json_annotation/json_annotation.dart';

part 'cart_product.g.dart';

@JsonSerializable()
class CartProduct {
  int id;
  String title;
  double price;
  int quantity;
  double total;
  double discountPercentage;
  double discountedPrice;

  CartProduct({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.total,
    required this.discountPercentage,
    required this.discountedPrice,
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) =>
      _$CartProductFromJson(json);

  Map<String, dynamic> toJson() => _$CartProductToJson(this);
}
