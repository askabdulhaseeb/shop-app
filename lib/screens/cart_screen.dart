import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart' show Cart;
import '../widgets/cart_item.dart';
import '../providers/order.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/CartScreen';
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your  Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            color: Colors.white70,
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                children: <Widget>[
                  Text(
                    'Total Amount',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '${cart.getTotalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                          color:
                              Theme.of(context).primaryTextTheme.title.color),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                    child: Text(
                      'Order Now',
                      // style: TextStyle(
                      //   fontWeight: FontWeight.bold,
                      //   color: Theme.of(context).accentColor,
                      // ),
                    ),
                    onPressed: () {
                      Provider.of<Order>(context, listen: false).addOrder(
                          cart.getCartItem.values.toList(),
                          cart.getTotalAmount);
                      cart.clearCart();
                    },
                    textColor: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return CartItems(
                  id: cart.getCartItem.values.toList()[index].id,
                  title: cart.getCartItem.values.toList()[index].title,
                  prodectId: cart.getCartItem.keys.toList()[index],
                  price: cart.getCartItem.values.toList()[index].price,
                  quantity: cart.getCartItem.values.toList()[index].quantity,
                  imageUrl: cart.getCartItem.values.toList()[index].imageUrl,
                );
              },
              itemCount: cart.itemCount,
            ),
          ),
        ],
      ),
    );
  }
}
