import 'package:designing/ProductListView.dart';
import 'package:designing/modelclass.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class WatchProvider with ChangeNotifier {
  final List<Item> watchlist = [
    Item(productName: "Apple Watch Ultra", image: "assets/images/watch2.webp"),
    Item(
        productName: "Apple Watch Series 8",
        image: "assets/images/watch3.webp"),
    Item(
        productName: "Apple Watch Series 8",
        image: "assets/images/watch5.webp"),
    Item(
        productName:
            "Apple Watch Series 8 [GPS 45 mm] Smart Watch w/Silver Aluminium Case with White Sport Band. Fitness Tracker, Blood Oxygen & ECG Apps, Always-On Retina Display, Water Resistant",
        image: "assets/images/watch4.webp")
  ];
}

class Watch extends StatelessWidget {
  const Watch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final phoneProvider = Provider.of<WatchProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone'),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: phoneProvider.watchlist.length,
        itemBuilder: (context, index) {
          final product = phoneProvider.watchlist[index];
          return ProductCard(product: product);
        },
      ),
    );
  }
}
