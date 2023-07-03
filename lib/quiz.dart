import 'package:flutter/material.dart';
import 'package:project/data/questions.dart';
import 'package:project/qscreen.dart';
import 'package:project/start.dart';
import 'package:project/results.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState(){
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List<String> answersList=[];

  @override
  void initState() {
    activeScreen=StartScreen(changeScreen);
    super.initState();
  }
  
  void changeScreen(){
    setState(() {
      activeScreen=Qscreen(chooseAns);
    });
  }

 void restartQuiz(){
    setState(() {
          answersList=[];
          activeScreen=Qscreen(chooseAns);
        });
 }
  void chooseAns(String answer){
    answersList.add(answer);
    if(answersList.length==questions.length){
      setState(() {
        activeScreen=ResultS(answersList,restartQuiz);
      });
    }
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 39, 176, 250),
              Color.fromARGB(176, 82, 233, 250)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child:activeScreen,
        ),
      ),
    );
  }
}