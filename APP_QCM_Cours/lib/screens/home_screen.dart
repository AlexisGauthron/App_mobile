import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/questions_data.dart';
import '../providers/progress_provider.dart';
import '../providers/quiz_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/category_card.dart';
import 'quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final progress = context.watch<ProgressProvider>();
    final masteredCount = allCategories.where((c) => progress.getBestScore(c.id) >= 80).length;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'QCM Flutter & Dart',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Formation ECE - Teste tes connaissances',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 24),
                    // Progress card
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [AppTheme.primary, AppTheme.primaryDark],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Progression globale',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                '$masteredCount/${allCategories.length}',
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: LinearProgressIndicator(
                              value: allCategories.isEmpty ? 0 : masteredCount / allCategories.length,
                              backgroundColor: Colors.white24,
                              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                              minHeight: 8,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _encouragementText(masteredCount, allCategories.length),
                            style: const TextStyle(color: Colors.white70, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Catégories',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final category = allCategories[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: CategoryCard(
                        category: category,
                        bestScore: progress.getBestScore(category.id),
                        attempts: progress.getAttempts(category.id),
                        onTap: () {
                          context.read<QuizProvider>().startQuiz(category.questions);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => QuizScreen(category: category),
                            ),
                          );
                        },
                      ),
                    );
                  },
                  childCount: allCategories.length,
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
          ],
        ),
      ),
    );
  }

  String _encouragementText(int mastered, int total) {
    if (mastered == 0) return 'Commence par choisir une catégorie !';
    if (mastered < total ~/ 3) return 'Bon début ! Continue comme ça 💪';
    if (mastered < total * 2 ~/ 3) return 'Tu progresses bien ! Plus que ${total - mastered} à maîtriser';
    if (mastered < total) return 'Presque expert ! Encore un effort 🔥';
    return 'Félicitations ! Tu maîtrises tout ! 🏆';
  }
}
