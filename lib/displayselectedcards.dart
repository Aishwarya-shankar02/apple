import 'package:designing/providerr.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final favoriteModel = Provider.of<FavourateModel>(context);
    return Scaffold(
        appBar: AppBar(
          title:const Center(child: Text('Favorites')),
          backgroundColor: Colors.orange,
          automaticallyImplyLeading: false,
        ),
        body: ListView.builder(
            itemCount: favoriteModel.favourate.length,
            itemBuilder: (context, index) {
              final product = favoriteModel.favourate[index];
              return Card(
                child: Column(
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
                                    overflow: TextOverflow.ellipsis),
                                maxLines: 3,
                              ),
                            ),
                          ),
                          SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Consumer<FavourateModel>(
                                    builder: (context, favoriteModel, child) {
                                      final isFavorite = favoriteModel.favourate
                                          .contains(product);
                                      return IconButton(
                                        onPressed: () {
                                          if (isFavorite) {
                                            favoriteModel
                                                .removeFromFavorites(product);
                                          } else {
                                            favoriteModel
                                                .addToFavorites(product);
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
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}
