import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/app_drawer.dart';
import '../providers/products_provider.dart';
import '../widgets/user_product_item.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = '/userProductScreen';

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductsProviders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: productData.getCopyOfItems.length,
        itemBuilder: (_, index) => UserProductItem(
          title: productData.getCopyOfItems[index].title,
          imageUrl: productData.getCopyOfItems[index].imageUrl,
        ),
      ),
    );
  }
}
