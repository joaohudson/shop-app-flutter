import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InvetoryPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventário'),
      ),
      body: Center(
        child: Text(
          'Inventário vazio',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
