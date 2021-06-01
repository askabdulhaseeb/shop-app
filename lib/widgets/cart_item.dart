import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartItems extends StatelessWidget {
  final String id;
  final String title;
  final double price;
  final int quantity;
  final String prodectId;
  final String imageUrl;

  CartItems({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.prodectId,
    @required this.quantity,
    @required this.imageUrl,
  });
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        padding: EdgeInsets.all(10),
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        child: Icon(
          Icons.delete,
          size: 40,
          color: Colors.white,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: Text('Are you sure!'),
              content: Text('Do you want to remove this item from the cart?'),
              actions: <Widget>[
                FlatButton(
                  child: Text('No'),
                  onPressed: () => Navigator.of(ctx).pop(false),
                ),
                FlatButton(
                  child: Text('Yes'),
                  onPressed: () => Navigator.of(ctx).pop(true),
                ),
              ],
            );
          },
        );
      },
      onDismissed: (direction) => Provider.of<Cart>(context, listen: false)
          .removeItemFromCart(prodectId),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
          child: ListTile(
            leading: Container(
              height: 60,
              width: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(imageUrl),
              ),
            ),
            title: Text('$title'),
            trailing: Text('$price  X  $quantity'),
            subtitle: Text('Total ${price * quantity}'),
          ),
        ),
      ),
    );
  }
}
