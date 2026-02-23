import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class OptionTile extends StatelessWidget {
  final String text;
  final int index;
  final bool isSelected;
  final bool isCorrect;
  final bool showResult;
  final VoidCallback onTap;

  const OptionTile({
    super.key,
    required this.text,
    required this.index,
    required this.isSelected,
    required this.isCorrect,
    required this.showResult,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final letters = ['A', 'B', 'C', 'D'];

    Color borderColor = AppTheme.cardBorder;
    Color bgColor = AppTheme.surface;
    Color letterBg = AppTheme.surfaceLight;
    Color letterColor = AppTheme.textSecondary;

    if (showResult) {
      if (isCorrect) {
        borderColor = AppTheme.correct;
        bgColor = AppTheme.correct.withValues(alpha: 0.1);
        letterBg = AppTheme.correct;
        letterColor = Colors.white;
      } else if (isSelected && !isCorrect) {
        borderColor = AppTheme.incorrect;
        bgColor = AppTheme.incorrect.withValues(alpha: 0.1);
        letterBg = AppTheme.incorrect;
        letterColor = Colors.white;
      }
    } else if (isSelected) {
      borderColor = AppTheme.primary;
      bgColor = AppTheme.primary.withValues(alpha: 0.1);
      letterBg = AppTheme.primary;
      letterColor = Colors.white;
    }

    return GestureDetector(
      onTap: showResult ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor, width: 1.5),
        ),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: letterBg,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  letters[index],
                  style: TextStyle(
                    color: letterColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 15,
                ),
              ),
            ),
            if (showResult && isCorrect)
              const Icon(Icons.check_circle, color: AppTheme.correct, size: 22),
            if (showResult && isSelected && !isCorrect)
              const Icon(Icons.cancel, color: AppTheme.incorrect, size: 22),
          ],
        ),
      ),
    );
  }
}
