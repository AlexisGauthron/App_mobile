import 'package:flutter/material.dart';
import '../model/product.dart';
import '../res/app_colors.dart';

/// Widget qui affiche le groupe Nova avec badge circulaire et texte descriptif
class NovaScoreWidget extends StatelessWidget {
  final ProductNovaScore novaScore;

  const NovaScoreWidget({
    super.key,
    required this.novaScore,
  });

  @override
  Widget build(BuildContext context) {
    final (int groupNumber, Color color, String description) =
        _getNovaDetails(novaScore);

    return Row(
      children: [
        // Badge circulaire
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              groupNumber.toString(),
              style: const TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        // Texte
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Groupe $groupNumber',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.grey3,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }

  (int, Color, String) _getNovaDetails(ProductNovaScore score) {
    return switch (score) {
      ProductNovaScore.group1 => (
          1,
          AppColors.nova1,
          'Aliments non transformés ou transformés minimalement'
        ),
      ProductNovaScore.group2 => (
          2,
          AppColors.nova2,
          'Ingrédients culinaires transformés'
        ),
      ProductNovaScore.group3 => (
          3,
          AppColors.nova3,
          'Aliments transformés'
        ),
      ProductNovaScore.group4 => (
          4,
          AppColors.nova4,
          'Produits alimentaires et boissons ultra-transformés'
        ),
      ProductNovaScore.unknown => (
          0,
          AppColors.grey2,
          'Information non disponible'
        ),
    };
  }
}
