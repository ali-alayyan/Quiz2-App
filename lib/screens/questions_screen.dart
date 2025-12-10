import 'package:flutter/material.dart';
import '../data/questions.dart';
import '../widgets/question_item.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
    required this.onSubmit,
  });

  final Function(int, String) onSelectAnswer;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ...questions.asMap().entries.map((entry) {
              int qIndex = entry.key;
              var question = entry.value;

              return QuestionItem(
                questionIndex: qIndex,
                question: question,
                onSelectAnswer: onSelectAnswer,
              );
            }),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: onSubmit,
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}