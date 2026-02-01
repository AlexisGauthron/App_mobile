import 'package:flutter/material.dart';
import '../model/product.dart';

class ProductNotifier extends ChangeNotifier {
  /// Attribut privé de type Product?, initialement null
  Product? _product;

  /// Constructeur : appelle loadProduct() dès la création
  ProductNotifier() {
    loadProduct();
  }

  /// Getter qui expose l'objet Product
  Product? get product => _product;

  /// Méthode de chargement : initialise le produit avec de fausses données
  /// et notifie les listeners du changement
  void loadProduct() {
    _product = generateProduct();
    notifyListeners();
  }
}
