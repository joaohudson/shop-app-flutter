import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/repositories/inventory-repository.dart';

class InvetoryPage extends StatelessWidget {
  Widget build(BuildContext context) {
    final items = InvetoryRepository().listAll();
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventário'),
      ),
      body: items.isEmpty
          ? Center(
              child: Text(
                'Inventário vazio',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index].product.name),
                  subtitle: Text('Quantidade: ${items[index].quantity}'),
                  trailing: Text(items[index].product.description),
                );
              },
            ),
    );
  }
}
