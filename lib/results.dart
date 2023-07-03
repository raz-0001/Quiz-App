import 'package:flutter/material.dart';
import 'package:project/data/questions.dart';
import 'package:project/questions_summary/questions_summary.dart';

class ResultS extends StatelessWidget {
  const ResultS(this.answersList, this.onRestart, {super.key});

  final List<String> answersList;
  final void Function() onRestart;

  List<Map<String, Object>> getSummarydata() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < answersList.length; i++) {
      summary.add({
        'question-index': i,
        'question': questions[i].text,
        'correctans': questions[i].answers[0],
        'chosenans': answersList[i]
      });
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummarydata();
    final totalQ = questions.length;
    final correctA = summaryData.where((data) {
      return data['correctans'] == data['chosenans'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You have answered $correctA out of $totalQ questions correctly!",
              style: const TextStyle(
                  color: Color.fromARGB(255, 30, 71, 234),
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
                onPressed: onRestart,
                style: TextButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 251, 248, 248)),
                icon: const Icon(Icons.refresh),
                label: const Text("Restart"))
          ],
        ),
      ),
    );
  }
}
