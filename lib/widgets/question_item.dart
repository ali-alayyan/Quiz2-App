import 'package:flutter/material.dart';
import '../models/quiz_question.dart';

class QuestionItem extends StatelessWidget {
  final int questionIndex;
  final QuizQuestion question;
  final Function(int, String) onSelectAnswer;

  const QuestionItem({
    super.key,
    required this.questionIndex,
    required this.question,
    required this.onSelectAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "${questionIndex + 1}. ${question.text}",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          SizedBox(
            width: 200,
            child: Column(
              children: [
                ...question.shuffledAnswers.map(
                      (ans) => Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ElevatedButton(
                      onPressed: () => onSelectAnswer(questionIndex, ans),
                      child: Text(ans),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}