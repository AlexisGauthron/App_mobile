import 'package:flutter/foundation.dart';
import '../models/question.dart';

class QuizProvider extends ChangeNotifier {
  List<Question> _questions = [];
  int _currentIndex = 0;
  int _score = 0;
  int? _selectedOption;
  bool _answered = false;
  final List<int> _wrongAnswerIndices = [];

  List<Question> get questions => _questions;
  int get currentIndex => _currentIndex;
  int get score => _score;
  int? get selectedOption => _selectedOption;
  bool get answered => _answered;
  List<int> get wrongAnswerIndices => _wrongAnswerIndices;
  Question get currentQuestion => _questions[_currentIndex];
  bool get isLastQuestion => _currentIndex == _questions.length - 1;
  double get progress => _questions.isEmpty ? 0 : (_currentIndex + 1) / _questions.length;

  void startQuiz(List<Question> questions) {
    _questions = List.from(questions)..shuffle();
    _currentIndex = 0;
    _score = 0;
    _selectedOption = null;
    _answered = false;
    _wrongAnswerIndices.clear();
    notifyListeners();
  }

  void selectOption(int index) {
    if (_answered) return;
    _selectedOption = index;
    _answered = true;
    if (index == _questions[_currentIndex].correctIndex) {
      _score++;
    } else {
      _wrongAnswerIndices.add(_currentIndex);
    }
    notifyListeners();
  }

  void nextQuestion() {
    if (_currentIndex < _questions.length - 1) {
      _currentIndex++;
      _selectedOption = null;
      _answered = false;
      notifyListeners();
    }
  }

  List<Question> get wrongAnswers =>
      _wrongAnswerIndices.map((i) => _questions[i]).toList();
}
