import 'package:shop/models/product-model.dart';

class InventoryItemModel {
  final ProductModel product;
  final int quantity;

  InventoryItemModel(this.product, this.quantity);

  factory InventoryItemModel.fromJson(Map<String, dynamic> json) =>
      InventoryItemModel(
          ProductModel.fromJson(json['product']), json['quantity']);

  @override
  String toString() {
    return 'InventoryItemModel( $quantity, ${product.toString()} )';
  }
}
