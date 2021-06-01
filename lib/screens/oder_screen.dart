import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/order.dart' show Order;
import '../widgets/app_drawer.dart';
import '../widgets/order_list_view.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/OrderScreen';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Order>(context);
    print(orderData.getOrdersList.length);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orderData.getOrdersList.length,
        itemBuilder: (context, index) => OrderListView(
          orderData.getOrdersList[index],
        ),
      ),
    );
  }
}
