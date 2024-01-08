import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quiz/data/question.dart';
import 'package:quiz/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.choosenAnswer});
  final List<String> choosenAnswer;

  List<Map<String, Object>> getsummary() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < choosenAnswer.length; i++) {
      summary.add(
        {
          'questionIndex': i,
          'question': question[i].text,
          'correctAnswer': question[i].answer[0],
          'userAnswer': choosenAnswer[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summardata = getsummary();
    final numberofQuestion = question.length;
    // final numberofCurrectAns = summardata.where((data) {
    //   return data['userAnswer'] == data['correctAnswer'];
    // }).length;
    final numberofCurrectAns = summardata
        .where(
          (data) => data['userAnswer'] == data['correctAnswer'],
        )
        .length;
    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsetsDirectional.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'You answered $numberofCurrectAns out of $numberofQuestion Question Correctly!'),
              const SizedBox(
                height: 30,
              ),
              QuestionSummary(summardata),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Restart'),
              ),
            ],
          ),
        ));
  }
}
