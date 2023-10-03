
import 'package:designing/ProductListView.dart';
import 'package:designing/modelclass.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class KeyboardProvider with ChangeNotifier {
 final List<Item> keyboardlist = [
      Item(
        productName: "2021 Apple TV 4K (32GB) \n 2nd Generation",
        image: "assets/images/815g8Uo656S._SX679_.jpg"),
  ];
  
}

class Keyboard extends StatelessWidget {
  const Keyboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final phoneProvider = Provider.of<KeyboardProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title:const Text('Phone'),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: phoneProvider.keyboardlist.length,
        itemBuilder: (context, index) {
          final product = phoneProvider.keyboardlist[index];
          return ProductCard(product: product);
        },
      ),
    );
  }
}


