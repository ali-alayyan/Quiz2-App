import '../models/quiz_question.dart';

final questions = [
  QuizQuestion(
    text:
        "Which function is responsible for starting a Flutter app?",
    answers: [
      "startApp()",
      "runApp()",
      "run()",
      "runFlutter()",
    ],
    correctAnswer: "runApp()",
  ),
  QuizQuestion(
    text: "Flutter uses which language?",
    answers: ["Dart", "Java", "Kotlin", "Swift"],
    correctAnswer: 'Dart',
  ),
  QuizQuestion(
    text:
        "Which widget is used to place widgets vertically?",
    answers: ["Column", "Row", "Container", "Stack"],
    correctAnswer: 'Column',
  ),
  QuizQuestion(
    text:
        "Which widget is used to place widgets horizontally?",
    answers: ["Column", "Row", "Container", "Stack"],
    correctAnswer: 'Row',
  ),
];
