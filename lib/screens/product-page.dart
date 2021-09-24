import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:shop/models/product-model.dart';
import 'package:shop/services/api-service.dart';

class ProductPage extends StatelessWidget {
  final apiService = ApiService();

  void showSnackBarMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.black,
      ));
  }

  void purchaseProduct(BuildContext context, ProductModel product) async {
    try {
      await apiService.purchaseProduct(product.name);
      showSnackBarMessage(
          context, 'Você gastou \$${product.price} em ${product.name}');
    } catch (e) {
      showSnackBarMessage(context, e.toString());
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos'),
      ),
      body: FutureBuilder(
        future: apiService.listAllProducts(),
        builder: (context, AsyncSnapshot<List<ProductModel>> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var product = snapshot.data![index];
              return ExpansionTile(
                title: Text(product.name),
                subtitle: Text('\$${product.price}'),
                trailing: Text(product.description),
                children: [
                  IconButton(
                    tooltip: 'Comprar?',
                    onPressed: () async {
                      purchaseProduct(context, product);
                    },
                    icon: Icon(Icons.monetization_on_outlined),
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}
