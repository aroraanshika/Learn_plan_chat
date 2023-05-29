import 'package:flutter/material.dart';

import 'quiz.dart';

void main() {
  runApp(Quiz());
}

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
              opacity: 0.8,
              child: Image.asset('images/image1.png', width: 700)),
          const SizedBox(height: 10),
          const Text('Learning Made Easy!',
              style: TextStyle(color: Colors.yellowAccent, fontSize: 28)),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: () {
              startQuiz();
            },
            style: OutlinedButton.styleFrom(foregroundColor: Colors.yellow),
            label: const Text('Start Quiz'),
            icon: const Icon(Icons.arrow_right_alt),
          ),
        ],
      ),
    );
  }
}
