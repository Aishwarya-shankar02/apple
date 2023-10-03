import 'package:designing/ProductListView.dart';
import 'package:designing/modelclass.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class PhoneProvider with ChangeNotifier {
  final List<Item> phonelist = [
    Item(
        productName: "Apple iPhone 11(64GB) - White ] 2019",
        image: "assets/images/61BGE6iu4AL._SX522_.jpg"),
    Item(
        productName: "Apple iPhone14 Pro Max (128 GB)  - Gold  2022",
        image: "assets/images/31DaY6l18YL._SY445_SX342_QL70_FMwebp_.webp"),
    Item(
        productName: "Apple iPhone 15 Pro Max \n  (128 GB)  - Gold  2022",
        image: "assets/images/31DaY6l18YL._SY445_SX342_QL70_FMwebp_.webp"),
    Item(
        productName: "Apple iPhone 14 \n Plus (128 GB) - Blue",
        image: "assets/images/61BGE6iu4AL._SX522_.jpg"),
        Item(productName: "\tiPhone 15 Pro", image: "assets/images/iphone-15-pro-202309.jpg"),
     Item(productName: "iPhone 15\n6.1-inch displayFootnote", image: "assets/images/iphone-15.jpg"),
     Item(productName: "Apple iPhone 12 (256GB) - (Product) RED", image: "assets/images/apple phone1.jpg"),
     Item(productName: "Apple iPhone SE (64 GB) - Midnight (3rd Generation)", image: "assets/images/iphone-se.jpg")
     
  ];
}

class Phone extends StatelessWidget {
  const Phone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final phoneProvider = Provider.of<PhoneProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title:const Text('Phone'),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: phoneProvider.phonelist.length,
        itemBuilder: (context, index) {
          final product = phoneProvider.phonelist[index];
          return ProductCard(product: product);
        },
      ),
    );
  }
}
