import 'package:flutter/material.dart';
import '../model/product.dart';

class ProductInherited extends InheritedWidget {
  // L'objet Product à propager dans l'arbre
  final Product product;

  const ProductInherited({
    super.key,
    required this.product,
    required super.child,
  });

  /// Méthode statique pour récupérer le Product depuis n'importe quel widget enfant
  static ProductInherited of(BuildContext context) {
    final ProductInherited? result =
        context.dependOnInheritedWidgetOfExactType<ProductInherited>();
    assert(result != null, 'Aucun ProductInherited trouvé dans le contexte');
    return result!;
  }

  /// Détermine si les widgets dépendants doivent être reconstruits
  @override
  bool updateShouldNotify(ProductInherited oldWidget) {
    return product != oldWidget.product;
  }
}