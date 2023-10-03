
import 'package:designing/ProductListView.dart';
import 'package:designing/keyboard.dart';
import 'package:designing/laptop.dart';
import 'package:designing/phone.dart';
import 'package:designing/tablet.dart';
import 'package:designing/watch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPhoneList extends StatefulWidget {
  const SearchPhoneList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchPhoneListState createState() => _SearchPhoneListState();
}

class _SearchPhoneListState extends State<SearchPhoneList> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = "";

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final phoneProvider = Provider.of<PhoneProvider>(context);
    final keyboardProvider = Provider.of<KeyboardProvider>(context);
final tabbProvider = Provider.of<TabbProvider>(context);
final laptopprovider = Provider.of<LaptopProvider>(context);
final watchprovider = Provider.of<WatchProvider>(context);
    final allProducts = [
      ...phoneProvider.phonelist,
      ...keyboardProvider.keyboardlist,
        ...tabbProvider.tabblist,
        ...laptopprovider.laptoplist,
             ...watchprovider.watchlist
    ];

    final filteredProducts = allProducts
        .where((product) => product.productName
            .toLowerCase()
            .contains(_searchText.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orange,
        title: const Text("Search"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Search by Name',
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return ProductCard(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Products'),
        backgroundColor: Colors.orange,
      ),
      body: const SearchPhoneList(), // Use the updated SearchPhoneList widget
    );
  }
}
