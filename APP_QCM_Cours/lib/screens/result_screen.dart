import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/question.dart';
import '../providers/progress_provider.dart';
import '../providers/quiz_provider.dart';
import '../theme/app_theme.dart';
import 'quiz_screen.dart';
import 'review_screen.dart';

class ResultScreen extends StatefulWidget {
  final Category category;

  const ResultScreen({super.key, required this.category});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final quiz = context.read<QuizProvider>();
      context.read<ProgressProvider>().saveScore(
            widget.category.id,
            quiz.score,
            quiz.questions.length,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final quiz = context.read<QuizProvider>();
    final percentage = ((quiz.score / quiz.questions.length) * 100).round();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Spacer(),
              // Score circle
              Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      _scoreColor(percentage),
                      _scoreColor(percentage).withValues(alpha: 0.6),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '$percentage%',
                        style: const TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '${quiz.score}/${quiz.questions.length}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                _resultTitle(percentage),
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                _resultMessage(percentage),
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              // Buttons
              if (quiz.wrongAnswers.isNotEmpty) ...[
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ReviewScreen(
                            wrongQuestions: quiz.wrongAnswers,
                            categoryName: widget.category.name,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.rate_review_outlined),
                    label: Text('Revoir les erreurs (${quiz.wrongAnswers.length})'),
                  ),
                ),
                const SizedBox(height: 12),
              ],
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    context.read<QuizProvider>().startQuiz(widget.category.questions);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => QuizScreen(category: widget.category),
                      ),
                    );
                  },
                  icon: const Icon(Icons.replay),
                  label: const Text('Recommencer'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppTheme.textPrimary,
                    side: const BorderSide(color: AppTheme.cardBorder),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
                  child: const Text('Retour à l\'accueil'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _scoreColor(int percentage) {
    if (percentage >= 80) return AppTheme.correct;
    if (percentage >= 50) return Colors.orange;
    return AppTheme.incorrect;
  }

  String _resultTitle(int percentage) {
    if (percentage == 100) return 'Parfait !';
    if (percentage >= 80) return 'Excellent !';
    if (percentage >= 60) return 'Bien joué !';
    if (percentage >= 40) return 'Pas mal !';
    return 'Continue d\'apprendre !';
  }

  String _resultMessage(int percentage) {
    if (percentage == 100) return 'Tu maîtrises parfaitement ce sujet !';
    if (percentage >= 80) return 'Tu as une très bonne compréhension. Revois les erreurs pour viser le 100% !';
    if (percentage >= 60) return 'Bonne base ! Revois les points faibles pour t\'améliorer.';
    if (percentage >= 40) return 'Tu progresses ! Relis le cours et retente le quiz.';
    return 'Ce sujet nécessite plus de travail. Relis le cours avant de réessayer.';
  }
}
