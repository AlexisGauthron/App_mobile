import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/question.dart';
import '../providers/quiz_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/option_tile.dart';
import 'result_screen.dart';

class QuizScreen extends StatelessWidget {
  final Category category;

  const QuizScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(
      builder: (context, quiz, _) {
        final question = quiz.currentQuestion;
        return Scaffold(
          appBar: AppBar(
            title: Text(category.name),
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => _showQuitDialog(context),
            ),
          ),
          body: SafeArea(
            child: Column(
              children: [
                // Progress bar
                LinearProgressIndicator(
                  value: quiz.progress,
                  backgroundColor: AppTheme.surfaceLight,
                  valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.primary),
                  minHeight: 4,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Question counter
                        Text(
                          'Question ${quiz.currentIndex + 1}/${quiz.questions.length}',
                          style: const TextStyle(
                            color: AppTheme.textSecondary,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Difficulty badge
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: _difficultyColor(question.difficulty).withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            _difficultyLabel(question.difficulty),
                            style: TextStyle(
                              color: _difficultyColor(question.difficulty),
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Question text
                        Text(
                          question.question,
                          style: const TextStyle(
                            color: AppTheme.textPrimary,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        // Code snippet
                        if (question.codeSnippet != null) ...[
                          const SizedBox(height: 16),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color(0xFF0D1117),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppTheme.cardBorder),
                            ),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                question.codeSnippet!,
                                style: const TextStyle(
                                  fontFamily: 'monospace',
                                  fontSize: 13,
                                  color: Color(0xFFE6EDF3),
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ),
                        ],
                        const SizedBox(height: 24),
                        // Options
                        ...List.generate(question.options.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: OptionTile(
                              text: question.options[index],
                              index: index,
                              isSelected: quiz.selectedOption == index,
                              isCorrect: index == question.correctIndex,
                              showResult: quiz.answered,
                              onTap: () => quiz.selectOption(index),
                            ),
                          );
                        }),
                        // Explanation
                        if (quiz.answered) ...[
                          const SizedBox(height: 16),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: (quiz.selectedOption == question.correctIndex
                                      ? AppTheme.correct
                                      : AppTheme.incorrect)
                                  .withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: (quiz.selectedOption == question.correctIndex
                                        ? AppTheme.correct
                                        : AppTheme.incorrect)
                                    .withValues(alpha: 0.3),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      quiz.selectedOption == question.correctIndex
                                          ? Icons.check_circle
                                          : Icons.info_outline,
                                      color: quiz.selectedOption == question.correctIndex
                                          ? AppTheme.correct
                                          : AppTheme.incorrect,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      quiz.selectedOption == question.correctIndex
                                          ? 'Bonne réponse !'
                                          : 'Explication',
                                      style: TextStyle(
                                        color: quiz.selectedOption == question.correctIndex
                                            ? AppTheme.correct
                                            : AppTheme.incorrect,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  question.explanation,
                                  style: const TextStyle(
                                    color: AppTheme.textPrimary,
                                    fontSize: 14,
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                // Bottom button
                if (quiz.answered)
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (quiz.isLastQuestion) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ResultScreen(category: category),
                              ),
                            );
                          } else {
                            quiz.nextQuestion();
                          }
                        },
                        child: Text(
                          quiz.isLastQuestion ? 'Voir les résultats' : 'Question suivante',
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showQuitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppTheme.surface,
        title: const Text('Quitter le quiz ?'),
        content: const Text('Ta progression ne sera pas sauvegardée.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Continuer'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pop(context);
            },
            child: const Text('Quitter', style: TextStyle(color: AppTheme.incorrect)),
          ),
        ],
      ),
    );
  }

  Color _difficultyColor(Difficulty d) {
    switch (d) {
      case Difficulty.debutant:
        return AppTheme.correct;
      case Difficulty.intermediaire:
        return Colors.orange;
      case Difficulty.avance:
        return AppTheme.incorrect;
    }
  }

  String _difficultyLabel(Difficulty d) {
    switch (d) {
      case Difficulty.debutant:
        return 'Débutant';
      case Difficulty.intermediaire:
        return 'Intermédiaire';
      case Difficulty.avance:
        return 'Avancé';
    }
  }
}
