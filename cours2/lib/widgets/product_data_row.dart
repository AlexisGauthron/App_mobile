import 'package:flutter/material.dart';
import '../res/app_colors.dart';
import 'product_separator.dart';

/// Widget réutilisable pour afficher une paire libellé/valeur
/// Utilisé pour afficher Quantité, Vendu, etc.
class ProductDataRow extends StatelessWidget {
  final String label;
  final String? value;
  final bool showSeparator;

  const ProductDataRow({
    super.key,
    required this.label,
    this.value,
    this.showSeparator = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Libellé à gauche
              Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              // Valeur à droite
              if (value != null)
                Flexible(
                  child: Text(
                    value!,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.grey3,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
            ],
          ),
        ),
        // Séparateur horizontal (optionnel)
        if (showSeparator)
          const ProductSeparator(axis: Axis.horizontal),
      ],
    );
  }
}
