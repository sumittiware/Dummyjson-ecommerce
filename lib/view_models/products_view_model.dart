import 'package:ecom_app/models/exception/exception.dart';
import 'package:ecom_app/models/product.dart';
import 'package:ecom_app/services/product_services.dart';
import 'package:ecom_app/utils/enum.dart';
import 'package:ecom_app/view_models/base/base_view_model.dart';

class ProductsViewModel extends BaseModel {
  final _productsService = ProductsServices();

  int _selectedProductId = 0;
  List<Product> _products = [];
  final Map<int, bool> _favouriteProducts = {};

  List<Product> get products => [..._products];
  Product get selectedProduct => _products.firstWhere(
        (e) => e.id == _selectedProductId,
      );
  List<Product> get favouriteProducts => _products
      .where(
        (p) =>
            _favouriteProducts.containsKey(p.id) && _favouriteProducts[p.id]!,
      )
      .toList();

  bool isFavourite(int value) {
    return _favouriteProducts.containsKey(value) && _favouriteProducts[value]!;
  }

  void setSelectedProduct(int value) {
    _selectedProductId = value;
    notifyListeners();
  }

  void addFavorite(int value) {
    _favouriteProducts[value] =
        !(_favouriteProducts.containsKey(value) && _favouriteProducts[value]!);
    notifyListeners();
  }

  Future<void> loadProducts({bool init = false}) async {
    if (init) {
      setState(ViewState.initalizing);
    } else {
      setState(ViewState.busy);
    }

    try {
      final newProducts = await _productsService.get();
      _products = [..._products, ...newProducts];
      setState(ViewState.idle);
    } on MyHttpException catch (e) {
      setState(ViewState.idle);
      if (e.code == "2") {
        setFullDataLoaded(true);
      } else {
        // Todo handle error
      }
    }
  }
}
