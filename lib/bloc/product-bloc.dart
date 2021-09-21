import 'dart:convert';

import 'package:shop/models/product-model.dart';
import 'package:http/http.dart' as http;

class ProductBloc {
  void buyProduct(ProductModel product) {
    print('-\$ $product');
  }

  Future<List<ProductModel>> listAll() async {
    try {
      String url = 'http://localhost:8080/products/list';
      var response = await http.get(Uri.parse(url));

      var json = await jsonDecode(response.body);
      var products = <ProductModel>[];

      for (var product in json) {
        products.add(ProductModel.fromJson(product));
      }

      return products;
    } catch (e) {
      print(e);
      throw 'Erro de conexão';
    }
  }
}
