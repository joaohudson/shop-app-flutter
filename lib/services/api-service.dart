import 'dart:convert';

import 'package:shop/models/inventory-item-model.dart';
import 'package:shop/models/product-model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static final _instance = ApiService._internal();

  ApiService._internal();

  factory ApiService() => _instance;

  Future<void> purchaseProduct(String productName) async {
    try {
      String url =
          'http://localhost:8080/product/purchase?productName=$productName';
      await http.post(Uri.parse(url));
    } catch (e) {
      print(e);
      throw 'Erro de conexão';
    }
  }

  Future<List<InventoryItemModel>> listAllInventory() async {
    try {
      String url = 'http://localhost:8080/user/inventory/listAll';
      var response = await http.get(Uri.parse(url));

      var json = await jsonDecode(response.body);
      var items = <InventoryItemModel>[];

      for (var product in json) {
        items.add(InventoryItemModel.fromJson(product));
      }

      return items;
    } catch (e) {
      print(e);
      throw 'Erro de conexão';
    }
  }

  Future<List<ProductModel>> listAllProducts() async {
    try {
      String url = 'http://localhost:8080/product/listAll';
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
