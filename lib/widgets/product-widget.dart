import 'package:flutter/material.dart';
import 'package:shop/models/product-model.dart';

class ProductWidget extends StatelessWidget {
  ProductWidget({required this.product, required this.purchaseProduct});

  final ProductModel product;
  final Function purchaseProduct;

  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(product.name),
      subtitle: Text('\$${product.price}'),
      trailing: Text(product.description),
      children: [
        IconButton(
          tooltip: 'Comprar?',
          onPressed: () {
            purchaseProduct(context, product);
          },
          icon: Icon(Icons.monetization_on_outlined),
        )
      ],
    );
  }
}
