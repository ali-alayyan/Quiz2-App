import 'package:flutter/material.dart';
import 'data/questions.dart';
import 'screens/questions_screen.dart';
import 'screens/result_screen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<String> selectedAnswers = List.filled(questions.length, "");
  String activeScreenName = "questions-screen";

  void _selectAnswer(int questionIndex, String answer) {
    setState(() {
      selectedAnswers[questionIndex] = answer;
    });
  }

  int get numberOfCorrectAnswers {
    int count = 0;

    for (int i = 0; i < questions.length; i++) {
      if (selectedAnswers[i] == questions[i].correctAnswer) {
        count++;
      }
    }
    return count;
  }

  void _submit() {
    setState(() {
      activeScreenName = "result-screen";
    });
  }

  void restart() {
    setState(() {
      selectedAnswers = List.filled(questions.length, "");
      activeScreenName = "questions-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screen;

    if (activeScreenName == "questions-screen") {
      screen = QuestionsScreen(
        onSelectAnswer: _selectAnswer,
        onSubmit: _submit,
      );
    } else {
      screen = ResultScreen(
        score: numberOfCorrectAnswers,
        onRestart: restart,
      );
    }

    return Scaffold(
      backgroundColor: Colors.green,
      body: screen,
    );
  }
}