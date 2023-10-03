import 'package:designing/keyboard.dart';
import 'package:designing/laptop.dart';
import 'package:designing/modelclass.dart';
import 'package:designing/phone.dart';
import 'package:designing/tablet.dart';
import 'package:designing/watch.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class FavourateModel extends ChangeNotifier {
  final List<Item> _favorites = [];
  List<Item> get favourate => _favorites;
  void addToFavorites(Item product) {
    _favorites.add(product);
    notifyListeners();
  }

  void removeFromFavorites(Item product) {
    _favorites.remove(product);
    notifyListeners();
  }
}

class SearchProvider with ChangeNotifier {
  final BuildContext context;
  SearchProvider(this.context);
  List<Item> searchResults = [];

  void searchProducts(String searchText) {
    final List<Item> allPeople = [
      ...Provider.of<PhoneProvider>(context, listen: false).phonelist,
      ...Provider.of<KeyboardProvider>(context, listen: false).keyboardlist,
      ...Provider.of<TabbProvider>(context, listen: false).tabblist,
      ...Provider.of<LaptopProvider>(context, listen: false).laptoplist,
      ...Provider.of<WatchProvider>(context, listen: false).watchlist,
    ];

    searchResults = allPeople.where((person) {
      return person.productName
          .toLowerCase()
          .contains(searchText.toLowerCase());
    }).toList();
    notifyListeners();
  }
}
