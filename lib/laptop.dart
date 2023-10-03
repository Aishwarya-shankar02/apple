

import 'package:designing/ProductListView.dart';
import 'package:designing/modelclass.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class LaptopProvider with ChangeNotifier {
  final List<Item> laptoplist = [
    Item(
        productName:
            "APPLE 2020 Macbook  Air M1 - (8 GB/256 GB  SSD/Mac OS Big Sur)  MGN63HN/A  (13.3 inch,  Space Grey, 1.29 kg)",
        image:
            "assets/images/apple-macbook-air-m1-13-3-inch-lightwings-original-imag3gh5xftgbpg3.webp"),
    Item(
        productName:
            "APPLE 2022 MacBook AIR M2 - (8 GB/256GB SSD/Mac OS Monterey) MLY13HN/A  (13.6 Inch, Starlight, 1.24 kg)",
        image: "assets/images/-original-imagfdfpnjjpdhq2.webp"),
    Item(
        productName:
            "APPLE 2022 MacBook AIR M2 - (8 GB/256 GB SSD/Mac OS Monterey) MLY33HN/A  (13.6 Inch, Midnight, 1.24 Kg)",
        image: "assets/images/-original-imagfdeqter4sj2j.webp"),
    Item(
        productName:
            "APPLE 2020 Macbook Air M1 - (8 GB/256 GB SSD/Mac OS Big Sur)  MGN93HN/A  (13.3 inch,  Silver, 1.29 kg)",
        image: "assets/images/apple-original-imafxfyqydgvrkzv.webp")
  ];
}

class Laptop extends StatelessWidget {
  const Laptop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final phoneProvider = Provider.of<LaptopProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title:const Text('Phone'),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: phoneProvider.laptoplist.length,
        itemBuilder: (context, index) {
          final product = phoneProvider.laptoplist[index];
          return ProductCard(product: product);
        },
      ),
    );
  }
}
