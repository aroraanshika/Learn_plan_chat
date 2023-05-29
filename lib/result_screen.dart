import 'package:learn_plan_chat/quiz.dart';
import 'package:flutter/material.dart';
import 'package:learn_plan_chat/data/questions.dart';
import 'package:learn_plan_chat/questions_summary.dart';
import 'package:learn_plan_chat/start_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answer $numCorrectQuestions out of $numTotalQuestions questions Correctly! ',
              // style: TextStyle(color: Colors.white),
              style: GoogleFonts.openSans(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                // textAlign: TextAlign.center
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(
              height: 30,
            ),

            QuestionSummary(summaryData),
            const SizedBox(
              height: 30,
            ),

            // TextButton(
            //   onPressed: () {
            //     Navigator.pushReplacement(
            //       // Navigate to StartScreen
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => StartScreen(),
            //       ),
            //     );
            //   },
            //   child: Text('Restart Quiz'),
            // )
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  // Navigate to StartScreen
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Quiz(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 40,
                ),
                backgroundColor: Color.fromARGB(155, 64, 49, 150),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              child: Text('Restart Quiz'),
            )
          ],
        ),
      ),
    );
  }
}
