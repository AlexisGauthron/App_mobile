import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProgressProvider extends ChangeNotifier {
  final Map<String, int> _bestScores = {};
  final Map<String, int> _totalAttempts = {};

  Map<String, int> get bestScores => Map.unmodifiable(_bestScores);
  Map<String, int> get totalAttempts => Map.unmodifiable(_totalAttempts);

  Future<void> loadProgress() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();
    for (final key in keys) {
      if (key.startsWith('best_')) {
        _bestScores[key.substring(5)] = prefs.getInt(key) ?? 0;
      } else if (key.startsWith('attempts_')) {
        _totalAttempts[key.substring(9)] = prefs.getInt(key) ?? 0;
      }
    }
    notifyListeners();
  }

  Future<void> saveScore(String categoryId, int score, int total) async {
    final prefs = await SharedPreferences.getInstance();
    final percentage = ((score / total) * 100).round();

    final currentBest = _bestScores[categoryId] ?? 0;
    if (percentage > currentBest) {
      _bestScores[categoryId] = percentage;
      await prefs.setInt('best_$categoryId', percentage);
    }

    _totalAttempts[categoryId] = (_totalAttempts[categoryId] ?? 0) + 1;
    await prefs.setInt('attempts_$categoryId', _totalAttempts[categoryId]!);

    notifyListeners();
  }

  int getBestScore(String categoryId) => _bestScores[categoryId] ?? 0;
  int getAttempts(String categoryId) => _totalAttempts[categoryId] ?? 0;

  double get overallProgress {
    if (_bestScores.isEmpty) return 0;
    final total = _bestScores.values.fold(0, (sum, score) => sum + score);
    return total / (_bestScores.length * 100);
  }
}
