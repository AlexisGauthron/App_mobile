enum Difficulty { debutant, intermediaire, avance }

class Question {
  final String id;
  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;
  final Difficulty difficulty;
  final String? codeSnippet;

  const Question({
    required this.id,
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.explanation,
    this.difficulty = Difficulty.intermediaire,
    this.codeSnippet,
  });
}

class Category {
  final String id;
  final String name;
  final String description;
  final String icon;
  final List<Question> questions;

  const Category({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.questions,
  });

  int get totalQuestions => questions.length;
}
