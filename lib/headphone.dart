import 'package:designing/ProductListView.dart';
import 'package:designing/modelclass.dart';
import 'package:flutter/material.dart';

class HeadPhone extends StatelessWidget {
  HeadPhone({Key? key}) : super(key: key);
  final List<Item> headphonelist = [
    Item(
        productName: "Apple EarPods with Lightning Connector",
        image: "assets/images/ear1.webp"),
    Item(
        productName:
            "Apple AirPods (3rd Generation) with Lightning Charging Case",
        image: "assets/images/ear2.jpg"),
    Item(
        productName:
            "Apple Beats Flex Wireless Earphones W1 Headphone Chip, Magnetic Earbuds, Class 1 Bluetooth, 12 Hours of Listening Time, Built-in Microphone - Blue",
        image: "assets/images/ear3.webp"),
    Item(
        productName:
            "Beats Fit Pro – True Wireless Noise Cancelling Earbuds – Active Noise Cancelling - Sweat Resistant Earphones, Compatible with Apple & Android, Class 1 Bluetooth®, Built-in Microphone – Black",
        image: "assets/images/ear4.jpg")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone'),
        backgroundColor: Colors.orange,
      ),
      body: ProductListView(products: headphonelist),
    );
  }
}
