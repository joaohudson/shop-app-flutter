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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductPage()),
                );
              },
              icon: Icon(Icons.shop),
              iconSize: iconSize,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InvetoryPage()),
                );
              },
              icon: Icon(Icons.inventory),
              iconSize: iconSize,
            ),
            IconButton(
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
