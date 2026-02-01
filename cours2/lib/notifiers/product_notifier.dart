import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../model/api_product_response.dart';
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

  /// Méthode de chargement asynchrone :
  /// 1. Appelle l'API avec Dio
  /// 2. Convertit la String en Map via jsonDecode
  /// 3. Parse la Map en classes API via fromJSON
  /// 4. Convertit les classes API en Product via toProduct()
  /// 5. Notifie les listeners du changement
  Future<void> loadProduct() async {
    final response = await Dio().get(
      'https://api.formation-flutter.fr/v2/getProduct',
      queryParameters: {'barcode': '5000159484695'},
    );

    // Étape 3 de l'énoncé : String -> Map via jsonDecode
    final Map<String, dynamic> json = response.data is String
        ? jsonDecode(response.data as String) as Map<String, dynamic>
        : response.data as Map<String, dynamic>;

    // Étape 3 : Map -> classes API via fromJSON
    final apiResponse = ApiProductResponse.fromJSON(json);

    // Étape 4 : classes API -> Product via convertisseur
    if (apiResponse.response != null) {
      _product = apiResponse.response!.toProduct();
      notifyListeners();
    }
  }
}
