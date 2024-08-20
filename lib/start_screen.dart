import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app/data/questions.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,{super.key});

  final void Function() startQuiz ;
  @override
  Widget build(context) {
    

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/quiz.png',
            width: 250,
            opacity: const AlwaysStoppedAnimation(.75),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Ready to Test your Space Knowledge ?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: "Inter",
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton.icon(
            onPressed: () {
              print('starting quiz');
              startQuiz();              
            },
            style: OutlinedButton.styleFrom(
              shadowColor: Colors.white,
              side: const BorderSide(width: 1.5, color: Colors.white),
            ),
            label: const Text(
              'Start Quiz ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: "Inter",
              ),
              // textAlign: TextAlign.center,
            ),
            icon: Icon(Icons.arrow_right_alt , color: Colors.white,),
          )
        ],
      ),
    );
  }
}
