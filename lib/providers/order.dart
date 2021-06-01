import 'package:flutter/material.dart';

import './cart.dart';

class OrderItems {
  final String id;
  final double totalAmount;
  final List<CartItem> productList;
  final DateTime date;

  const OrderItems({
    @required this.id,
    @required this.totalAmount,
    @required this.productList,
    @required this.date,
  });
}

class Order with ChangeNotifier {
  List<OrderItems> _orders = [];

  List<OrderItems> get getOrdersList {
    return [..._orders];
  }

  void addOrder(List<CartItem> product, double amount) {
    _orders.insert(
      0,
      OrderItems(
        id: DateTime.now().toString(),
        totalAmount: amount,
        productList: product,
        date: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
