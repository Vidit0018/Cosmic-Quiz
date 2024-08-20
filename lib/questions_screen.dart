
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/widgets/styledText.dart';

class QuestionsScreen extends StatefulWidget {
   QuestionsScreen({super.key , required this.onSelectAnswer} );

   final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswers){
    widget.onSelectAnswer(selectedAnswers);
    setState((){
      currentQuestionIndex ++;
    });
  }
  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,

        // : MainAxisSize.max,
        children: [
          Row(
            children: [
              Image.asset('assets/images/astronaut_on_moon.png', width: 150),
              SizedBox(
                width: 20,
              ),
              Image.asset('assets/images/satellite.png', width: 200),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 95,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                textAlign: TextAlign.center,
                currentQuestion.text,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Inter"),
              ),
            ),
          ),

          
          ...currentQuestion.getShuffledAnswers().map((answer) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  AnswerButton(text: answer, onTap: (){
                    answerQuestion(answer);
                  }),
                ],
              ),
            );
          }),

          Row(
            children: [
              // const SizedBox(width: 200,),
              Image.asset('assets/images/rocket_for_launch.png', width: 200),
              // Image.asset('assets/images/astronaut2.png', width: 150),
            ],
          ),
          // const SizedBox(height: 20,),
        ],
      ),
    );
  }
}
