import 'package:flutter/material.dart';
import '../res/app_colors.dart';

/// Widget séparateur réutilisable (1 pixel)
/// Peut être horizontal ou vertical selon le paramètre `axis`
class ProductSeparator extends StatelessWidget {
  final Axis axis;

  const ProductSeparator({
    super.key,
    required this.axis,
  });

  @override
  Widget build(BuildContext context) {
    if (axis == Axis.vertical) {
      return Container(
        width: 1,
        color: AppColors.grey2,
      );
    } else {
      return Container(
        height: 1,
        width: double.infinity,
        color: AppColors.grey2,
      );
    }
  }
}
