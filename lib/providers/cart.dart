import 'package:flutter/foundation.dart';

class CartItem {
  String id;
  String title;
  double price;
  int quantity;
  String imageUrl;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.quantity,
    @required this.imageUrl,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get getCartItem {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get getTotalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItemToCart(String productId, String productTitle, double productPrice,
      String productUrl) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingCartItem) => CartItem(
            id: existingCartItem.id,
            imageUrl: existingCartItem.imageUrl,
            title: existingCartItem.title,
            price: existingCartItem.price,
            quantity: existingCartItem.quantity + 1),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
            id: DateTime.now().toString(),
            imageUrl: productUrl,
            title: productTitle,
            price: productPrice,
            quantity: 1),
      );
    }
    notifyListeners();
  }

  void removeItemFromCart(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItemFromCart(String prodectId) {
    if (!_items.containsKey(prodectId)) return;
    if (_items[prodectId].quantity > 1) {
      _items.update(prodectId, (existingValue) {
        return CartItem(
          id: existingValue.id,
          title: existingValue.title,
          price: existingValue.price,
          quantity: existingValue.quantity - 1,
          imageUrl: existingValue.imageUrl,
        );
      });
    } else
      _items.remove(prodectId);
    notifyListeners();
  }

  void clearCart() {
    _items = {};
    notifyListeners();
  }
}
