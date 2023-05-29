import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  QuestionSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: summaryData.map((data) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 0.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   ((data['question_index'] as int) + 1).toString(),
                    //   style: TextStyle(color: Colors.white),
                    //   textAlign: TextAlign.left,
                    // ),

                    Text.rich(
                      TextSpan(
                        children: [
                          WidgetSpan(
                            child: CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(255, 132, 182, 222),
                              radius: 12, // Replace with desired color
                              child: Text(
                                ((data['question_index'] as int) + 1)
                                    .toString(),
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                            ),
                          ),
                          TextSpan(text: '\n'), // Add a new line for spacing
                        ],
                      ),
                      style: TextStyle(
                        color: Colors.white,
                        height: 1.5, // Adjust the line spacing as needed
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(10.0, 0.0, 8.0, 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data['question'] as String,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 234, 231, 231)),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const SizedBox(height: 5),
                            // Text(data['user_answer'] as String,
                            //     style: TextStyle(color: Colors.white)),
                            Text(
                              data['user_answer'] == data['correct_answer']
                                  ? data['user_answer'] as String
                                  : data['user_answer'] as String,
                              style: TextStyle(
                                color: data['user_answer'] ==
                                        data['correct_answer']
                                    ? Color.fromARGB(255, 91, 175, 76)
                                    : Colors.red,
                              ),
                            ),

                            const SizedBox(height: 5),
                            Text(data['correct_answer'] as String,
                                style: TextStyle(color: Colors.white))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
