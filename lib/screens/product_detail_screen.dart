import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedData = Provider.of<ProductsProviders>(
      context,
      listen: false,
    ).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedData.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              child: Card(
                elevation: 5,
                margin: EdgeInsets.all(10),
                child: Image.network(loadedData.imageUrl),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Price \$${loadedData.price}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(15),
              alignment: Alignment.center,
              child: Text(
                loadedData.description,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
