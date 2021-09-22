import 'package:shop/models/inventory-item-model.dart';

class InvetoryRepository {
  static InvetoryRepository _instance = InvetoryRepository._internal();

  InvetoryRepository._internal();

  factory InvetoryRepository() {
    return _instance;
  }

  Map<String, InventoryItemModel> _items = {};

  void add(InventoryItemModel item) {
    final key = item.product.name;

    if (_items.containsKey(key)) {
      int quantity = _items[key]!.quantity;
      _items[key] = InventoryItemModel(item.product, item.quantity + quantity);
    } else {
      _items[key] = item;
    }
  }

  List<InventoryItemModel> listAll() {
    var result = <InventoryItemModel>[];

    for (var item in _items.values) {
      result.add(item);
    }

    return result;
  }
}
