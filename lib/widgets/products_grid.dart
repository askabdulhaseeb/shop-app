import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './product_item.dart';
import '../providers/products_provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool _showFavoriteOnly;
  ProductsGrid(this._showFavoriteOnly);
  @override
  Widget build(BuildContext context) {
    final providersData = Provider.of<ProductsProviders>(context);
    final products = _showFavoriteOnly
        ? providersData.getFavoriteItems
        : providersData.getCopyOfItems;
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: products.length,
      itemBuilder: (ctx, index) {
        return ChangeNotifierProvider.value(
          // create: (c) => products[index],
          value: products[index],
          child: ProductItem(),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 3 / 2,
      ),
    );
  }
}
