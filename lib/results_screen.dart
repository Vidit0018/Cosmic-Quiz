import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';
import 'package:quiz_app/widgets/styledText.dart';

class ResultsScreen extends StatelessWidget {
  ResultsScreen({super.key, required this.chosenAnswers , required this.onRestartClicked});

  final List<String> chosenAnswers;
  final void Function() onRestartClicked ;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question ': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summatyData = getSummaryData();
    final numTotalQuestion = questions.length;
    final numCorrectQuestions = summatyData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Result',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30,),
            Text(

              textAlign: TextAlign.center,
              'You answered $numCorrectQuestions out of $numTotalQuestion questions correctly !',
              style: const TextStyle(color: Colors.green,
               fontFamily: "Inter", fontWeight: FontWeight.bold , fontSize: 14),
            ),
            const SizedBox(
              height: 30,
            ),

            QuestionsSummary(summaryData: getSummaryData()),
            // const Text(
            //   style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 16,
            //       fontFamily: "Inter",
            //       fontWeight: FontWeight.bold),
            // ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed:(){
                print('restart button clicked');
                onRestartClicked();
              },
              child: Styledtext('Restart Quiz'),
            )
          ],
        ),
      ),
    );
  }
}
