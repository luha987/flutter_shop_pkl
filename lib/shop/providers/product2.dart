import 'package:flutter/foundation.dart';

class Productt with ChangeNotifier {
  final String? id;
  final String? title;
  final String? description;
  final double? price;
  final String? imageUrl;
  bool isFavorite;

  Productt({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

  void statusFav() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
