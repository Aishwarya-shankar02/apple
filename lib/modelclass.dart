class Item {
  String productName;
  String image;
  bool isFavorite;
  Item(
      {required this.productName,
      this.isFavorite = false,
      required this.image});
}
