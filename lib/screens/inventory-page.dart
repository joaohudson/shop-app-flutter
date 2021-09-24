import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/models/inventory-item-model.dart';
import 'package:shop/services/api-service.dart';
import 'package:shop/widgets/inventory-item-widget.dart';

class InvetoryPage extends StatelessWidget {
  final apiService = ApiService();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventário'),
      ),
      body: FutureBuilder(
        future: apiService.listAllInventory(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return buildCenterMessage(context, snapshot.error.toString());
          }

          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final inventory = snapshot.data as List<InventoryItemModel>;

          if (inventory.isEmpty) {
            return buildCenterMessage(context, 'Inventário vazio!');
          }

          return ListView.builder(
            itemCount: inventory.length,
            itemBuilder: (context, index) {
              return InventoryItemWidget(item: inventory[index]);
            },
          );
        },
      ),
    );
  }

  Widget buildCenterMessage(BuildContext context, String message) {
    return Center(
      child: Text(
        message,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
