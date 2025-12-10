class QuizQuestion {
  final List<String> shuffledAnswers;

  QuizQuestion()
    : shuffledAnswers = List.of(answers)..shuffle();
}
