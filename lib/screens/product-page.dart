import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:shop/bloc/product-bloc.dart';
import 'package:shop/models/product-model.dart';

class ProductPage extends StatelessWidget {
  final ProductBloc productBloc = ProductBloc();

  void showSnackBarMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.black,
    ));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos'),
      ),
      body: FutureBuilder(
        future: productBloc.listAll(),
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
                    onPressed: () {
                      productBloc.buyProduct(product);
                      showSnackBarMessage(context,
                          'Você gastou \$${product.price} em ${product.name}');
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
