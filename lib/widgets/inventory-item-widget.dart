import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop/models/inventory-item-model.dart';

class InventoryItemWidget extends StatelessWidget {
  InventoryItemWidget({required this.item});

  final InventoryItemModel item;

  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.product.name),
      subtitle: Text('Quantidade: ${item.quantity}'),
      trailing: Text(item.product.description),
    );
  }
}
