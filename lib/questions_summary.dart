import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: summaryData.map(
              (data) {
                final userAnswer = data['user_answer'] as String;
                final correctAnswer = data['correct_answer'] as String;
                final isAnswerCorrect = userAnswer == correctAnswer;
                return SizedBox(
                  height: 90,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${((data['question_index'] as int) + 1)}.".toString(),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data['question'] as String,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              data['user_answer'] as String,
                              style: TextStyle(
                                  color: isAnswerCorrect
                                      ? Colors
                                          .green // Set to green if the answer is correct
                                      : const Color.fromARGB(
                                          255, 230, 200, 253)),
                            ),
                            Text(
                              data['correct_answer'] as String,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
