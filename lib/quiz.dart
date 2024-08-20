
import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget{ 
  const Quiz({super.key});
  @override
  State<Quiz>createState(){
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{
   List<String> selectedAnswers  = [];
  var activeScreen ;
  @override
  void initState() {
    activeScreen = "start-screen";
    super.initState();
  }
  void switchScreen(){
    setState(() {
      activeScreen =  "questions-screen";
    });
  }
  void chooseAnswer(String answer){
    selectedAnswers.add(answer);
    if(selectedAnswers.length == questions.length){
      setState((){
    print(selectedAnswers);
        // selectedAnswers= [];
        activeScreen = "result-screen";
      });
    }
  }
  void restartQuiz(){
    setState(() {
      
    selectedAnswers= [];
    activeScreen = 'questions-screen';
    });
  }
  @override
  Widget build(context){
    
    Widget screenWidget = StartScreen(switchScreen);
    if(activeScreen == 'questions-screen'){
      screenWidget =  QuestionsScreen(onSelectAnswer: chooseAnswer);
    }
    if(activeScreen == 'result-screen'){
      screenWidget = ResultsScreen(chosenAnswers: selectedAnswers ,onRestartClicked: restartQuiz);
    }
    return   MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.cover,
          ),
              // gradient: LinearGradient(
                // colors: [
                //   Color.fromRGBO(109, 49, 237, 1.000),
                //   Color.fromRGBO(105, 42, 242, 1)
                // ],
                // begin: Alignment.topLeft,
                // end: Alignment.bottomRight
              // ),
            ),
            child: screenWidget),
      ),
    );
  }
}