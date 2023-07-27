import 'package:ecom_app/models/cart_item.dart';
import 'package:ecom_app/models/exception/exception.dart';
import 'package:ecom_app/services/cart_services.dart';
import 'package:ecom_app/utils/enum.dart';
import 'package:ecom_app/view_models/base/base_view_model.dart';

class CartViewModel extends BaseModel {
  final _cartServices = CartServices();
  int _selectedCartId = 0;
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => [..._cartItems];

  CartItem get selectedCartItem => _cartItems.firstWhere(
        (e) => e.id == _selectedCartId,
      );

  void setSelectedCart(int value) {
    _selectedCartId = value;
    notifyListeners();
  }

  Future<void> loadCartItems({bool init = false}) async {
    if (init) {
      setState(ViewState.initalizing);
    } else {
      setState(ViewState.busy);
    }

    try {
      final newProducts = await _cartServices.get();
      _cartItems = [..._cartItems, ...newProducts];
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
