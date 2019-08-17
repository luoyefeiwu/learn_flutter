import 'package:flutter/material.dart';
import 'package:route_data/ProductList.dart';
import 'package:route_data/Product.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "传递数据实例",
      home: new ProductList(
          products: new List.generate(
              20, (i) => new Product("商品 $i", "这是一个商品详情 $i"))),
    );
  }
}
