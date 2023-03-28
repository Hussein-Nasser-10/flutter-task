import 'dart:convert';

import 'package:http/http.dart';

import '../model/product.dart';

List<Product> product = [];
Future<List<Product>> get_products() async {
  print("Get Products....");
  List<Product> products = [];
  Uri uri = Uri.parse('https://fakestoreapi.com/products');
  Response res = await get(uri);
  if (res.statusCode == 200) {
    print("Succeded!!");
    final list = json.decode(res.body) as List<dynamic>;
    return list.map((json) => Product.tojson(json)).toList();
  } else {
    return products;
  }
}
