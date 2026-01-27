import 'package:flutter/material.dart';
import '../model/product.dart';
import '../res/app_colors.dart';
import '../res/app_icons.dart';

/// Widget qui affiche le Green-Score avec icône et texte descriptif
class GreenScoreWidget extends StatelessWidget {
  final ProductGreenScore greenScore;

  const GreenScoreWidget({
    super.key,
    required this.greenScore,
  });

  @override
  Widget build(BuildContext context) {
    final (IconData icon, Color color, String description) =
        _getGreenScoreDetails(greenScore);

    return Row(
      children: [
        Icon(
          icon,
          size: 40,
          color: color,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _getScoreLabel(greenScore),
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

  String _getScoreLabel(ProductGreenScore score) {
    return switch (score) {
      ProductGreenScore.APlus => 'Green-Score A+',
      ProductGreenScore.A => 'Green-Score A',
      ProductGreenScore.B => 'Green-Score B',
      ProductGreenScore.C => 'Green-Score C',
      ProductGreenScore.D => 'Green-Score D',
      ProductGreenScore.E => 'Green-Score E',
      ProductGreenScore.F => 'Green-Score F',
      ProductGreenScore.unknown => 'Green-Score inconnu',
    };
  }

  (IconData, Color, String) _getGreenScoreDetails(ProductGreenScore score) {
    return switch (score) {
      ProductGreenScore.APlus => (
          AppIcons.ecoscore_a_plus,
          AppColors.greenScoreAPlus,
          'Très faible impact environnemental'
        ),
      ProductGreenScore.A => (
          AppIcons.ecoscore_a,
          AppColors.greenScoreA,
          'Très faible impact environnemental'
        ),
      ProductGreenScore.B => (
          AppIcons.ecoscore_b,
          AppColors.greenScoreB,
          'Faible impact environnemental'
        ),
      ProductGreenScore.C => (
          AppIcons.ecoscore_c,
          AppColors.greenScoreC,
          'Impact modéré sur l\'environnement'
        ),
      ProductGreenScore.D => (
          AppIcons.ecoscore_d,
          AppColors.greenScoreD,
          'Impact environnemental élevé'
        ),
      ProductGreenScore.E => (
          AppIcons.ecoscore_e,
          AppColors.greenScoreE,
          'Impact environnemental très élevé'
        ),
      ProductGreenScore.F => (
          AppIcons.ecoscore_f,
          AppColors.greenScoreF,
          'Impact environnemental très élevé'
        ),
      ProductGreenScore.unknown => (
          AppIcons.ecoscore_a,
          AppColors.grey2,
          'Information non disponible'
        ),
    };
  }
}
