import 'package:flutter/material.dart';
import 'package:route_data/Product.dart';
import 'package:route_data/ProductDetail.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;

  ProductList({Key key, this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("商品列表"),
      ),
      body: new ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return new ListTile(
              title: new Text(products[index].title),
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) =>
                            new ProductDetail(product: products[index])));
              },
            );
          }),
    );
  }
}
