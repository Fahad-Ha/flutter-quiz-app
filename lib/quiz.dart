import 'package:flutter/material.dart';

import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  // @override
  // void initState() {
  //   activeScreen = 'start-screen';
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void restart() {
    selectedAnswers = [];
    setState(() {
      activeScreen = 'start-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.deepPurple, Color.fromARGB(255, 111, 69, 185)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: activeScreen == 'start-screen'
              ? StartScreen(switchScreen)
              : activeScreen == 'results-screen'
                  ? ResultsScreen(
                      chosenAnswers: selectedAnswers,
                      onResetart: () {
                        restart();
                      },
                    )
                  : QuestionsScreen(onSelectAnswer: chooseAnswer),
        ),
      ),
    );
  }
}
