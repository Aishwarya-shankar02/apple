import 'package:designing/ProductListView.dart';
import 'package:designing/modelclass.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class TabbProvider with ChangeNotifier {
  final List<Item> tabblist = [
    Item(
        productName:
            "Apple 2021 10.2-inch  (25.91 cm) iPad with  A13 Bionic chip (Wi-Fi,  64GB) - Space Grey  (9th Generation)",
        image: "assets/images/61NGnpjoRDL._SX679_.jpg"),
    Item(
        productName:
            "Apple 2021 iPad  Pro M1 chip (12.9-inch/  32.77 cm, Wi-Fi, 128GB) - Silver (5th Generation)",
        image: "assets/images/815KnP2wjDS._SX679_.jpg"),
    Item(
        productName:
            "Apple 2022 iPad Air M1 Chip (10.9-inch/27.69 cm, Wi-Fi, 64GB) - Purple (5th Generation)",
        image: "assets/images/61k05QwLuML._SX679_.jpg"),
    Item(
        productName:
            "Apple 2021 iPad Mini with A15 Bionic chip (Wi-Fi, 64GB) - Starlight (6th Generation)",
        image: "assets/images/71o6PxcKkJL._SX679_.jpg")
  ];
}

class Tabb extends StatelessWidget {
  const Tabb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final phoneProvider = Provider.of<TabbProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone'),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: phoneProvider.tabblist.length,
        itemBuilder: (context, index) {
          final product = phoneProvider.tabblist[index];
          return ProductCard(product: product);
        },
      ),
    );
  }
}
