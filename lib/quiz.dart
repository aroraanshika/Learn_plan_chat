import 'package:flutter/material.dart';
import 'package:learn_plan_chat/data/questions.dart';
import 'package:learn_plan_chat/questions_screen.dart';
import 'package:learn_plan_chat/start_screen.dart';
import 'package:learn_plan_chat/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
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
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(onSelectAnswer: chooseAnswer);
    } else if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Color.fromARGB(255, 57, 47, 246),
          //   title: Text(
          //     'Start Screen',
          //     style: const TextStyle(
          //         color: Color.fromARGB(255, 236, 234, 234),
          //         fontWeight: FontWeight.normal,
          //         fontSize: 19),
          //   ),
          // ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 28, 24, 101),
                  const Color.fromARGB(255, 0, 0, 0),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: screenWidget,
          ),
        ),
      ),
    );
  }
}
