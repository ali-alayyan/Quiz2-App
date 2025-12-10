class QuizQuestion {
  final String text;
  final List<String> answers;
  final String correctAnswer;
  QuizQuestion({
    required this.text,
    required this.answers,
    required this.correctAnswer,
  });
  List<String> get shuffledAnswers {
    final shuffled = List.of(answers);
    shuffled.shuffle();
    return shuffled;
  }
}