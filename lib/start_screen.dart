import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 250,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(height: 50),
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.lato(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 50),
          ElevatedButton.icon(
            onPressed: startQuiz,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
            ),
            icon: const Icon(Icons.arrow_right),
            label: Text(
              'Start Quiz',
              style: GoogleFonts.lato(),
            ),
          ),
        ],
      ),
    );
  }
}
