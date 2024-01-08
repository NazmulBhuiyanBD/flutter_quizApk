import 'package:flutter/material.dart';
import 'package:quiz/data/question.dart';
import 'package:quiz/question_screen.dart';
import 'package:quiz/result_screen.dart';
import 'package:quiz/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;
  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  var activeScreen = 'StartScreen';

  void switchScreen() {
    setState(
      () {
        //activeScreen = const Question();
        activeScreen = 'QuestionScreen';
      },
    );
  }

  List<String> selectedAnswer = [];
  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == question.length) {
      setState(
        () {
          activeScreen = 'ResultScreen';
          //selectedAnswer = [];
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'QuestionScreen') {
      screenWidget = Question(onSelectAnswer: chooseAnswer);
    }
    if (activeScreen == 'ResultScreen') {
      screenWidget = ResultScreen(
        choosenAnswer: selectedAnswer,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 93, 4, 134),
                Color.fromARGB(255, 33, 0, 53),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          //child: activeScreen,

          // child: activeScreen == 'StartScreen'
          //     ? StartScreen(switchScreen)
          //     : const Question(),
          child: screenWidget,
        ),
      ),
    );
  }
}
