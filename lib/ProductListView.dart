// // ignore: file_names

// import 'package:designing/modelclass.dart';
// import 'package:designing/providerr.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ProductListView extends StatelessWidget {
//   final List<Item> products;

//   // ignore: use_key_in_widget_constructors
//   const ProductListView({required this.products});
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: products.length,
//       itemBuilder: (context, index) {
//         return ProductCard(product: products[index]);
//       },
//     );
//   }
// }

// class ProductCard extends StatelessWidget {
//   final Item product;

//   // ignore: use_key_in_widget_constructors
//   const ProductCard({required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.all(8.0),
//       child: SizedBox(
//         height: 200,
//         width: double.infinity,
//         child: ListTile(
//           leading: Image.asset(
//             product.image,
//             fit: BoxFit.cover,
//           ),
//           title: Flexible(
//             child: Padding(
//               padding: const EdgeInsets.all(1),
//               child: Text(
//                 product.productName,
//                 style: const TextStyle(
//                   fontSize: 18,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 maxLines: 5,
//               ),
//             ),
//           ),
//           trailing: Consumer<FavourateModel>(
//             builder: (context, favoriteModel, child) {
//               final isFavorite = favoriteModel.favourate.contains(product);
//               return IconButton(
//                 onPressed: () {
//                   if (isFavorite) {
//                     favoriteModel.removeFromFavorites(product);
//                   } else {
//                     favoriteModel.addToFavorites(product);
//                   }
//                 },
//                 icon: Icon(
//                   isFavorite ? Icons.favorite : Icons.favorite_border,
//                   color: isFavorite ? Colors.red : null,
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:designing/modelclass.dart';
import 'package:designing/providerr.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductListView extends StatelessWidget {
  final List<Item> products;

  ProductListView({required this.products});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(product: products[index]);
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  final Item product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    final favoriteModel = Provider.of<FavourateModel>(context, listen: false);
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(children: [
        ListTile(
          // title: Text(product.productName),
          // subtitle: Text(product.image),ListTile(
          title: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    SizedBox(
                        height: 200,
                        width: 115,
                        child: Image.asset(product.image)),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(1),
                        
                        child: Text(
                          product.productName,
                          style: const TextStyle(
                            fontSize: 18,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 5,
                        ),
                      ),
                    ),
                 
                  ],
                ),
              ),
            ],
          ),
          trailing:  Consumer<FavourateModel>(
                              builder: (context, favoriteModel, child) {
                                final isFavorite =
                                    favoriteModel.favourate.contains(product);
                                return IconButton(
                                  onPressed: () {
                                    if (isFavorite) {
                                      favoriteModel
                                          .removeFromFavorites(product);
                                    } else {
                                      favoriteModel.addToFavorites(product);
                                    }
                                  },
                                  icon: Icon(
                                    isFavorite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: isFavorite ? Colors.red : null,
                                  ),
                                );
                              },
                            ),
        )
      ]),
    );
  }
}