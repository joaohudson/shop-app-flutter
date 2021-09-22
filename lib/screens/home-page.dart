import 'package:flutter/material.dart';
import 'package:shop/screens/inventory-page.dart';
import 'package:shop/screens/login-page.dart';
import 'package:shop/screens/product-page.dart';

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    final iconSize = 80.0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              tooltip: 'Loja',
              padding: EdgeInsets.symmetric(vertical: 10),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductPage()),
                );
              },
              icon: Icon(Icons.shopping_cart_outlined),
              iconSize: iconSize,
            ),
            IconButton(
              tooltip: 'Inventário',
              padding: EdgeInsets.symmetric(vertical: 10),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InvetoryPage()),
                );
              },
              icon: Icon(Icons.shopping_bag_outlined),
              iconSize: iconSize,
            ),
            IconButton(
              tooltip: 'Voltar',
              padding: EdgeInsets.symmetric(vertical: 10),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              icon: Icon(Icons.exit_to_app),
              iconSize: iconSize,
            )
          ],
        ),
      ),
    );
  }
}
