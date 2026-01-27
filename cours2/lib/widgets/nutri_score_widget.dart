import 'package:flutter/material.dart';
import '../model/product.dart';
import '../res/app_images.dart';

/// Widget qui affiche l'image du Nutri-Score (A, B, C, D ou E)
/// Utilise des images statiques car le SVG est trop complexe
class NutriScoreWidget extends StatelessWidget {
  final ProductNutriScore nutriScore;

  const NutriScoreWidget({
    super.key,
    required this.nutriScore,
  });

  @override
  Widget build(BuildContext context) {
    final String imagePath = switch (nutriScore) {
      ProductNutriScore.A => AppImages.nutriscoreA,
      ProductNutriScore.B => AppImages.nutriscoreB,
      ProductNutriScore.C => AppImages.nutriscoreC,
      ProductNutriScore.D => AppImages.nutriscoreD,
      ProductNutriScore.E => AppImages.nutriscoreE,
      ProductNutriScore.unknown => AppImages.nutriscoreA,
    };

    return Image.asset(
      imagePath,
      fit: BoxFit.contain,
    );
  }
}
