import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/questions_summary/questions_indentifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData,{super.key});

  final Map<String,Object> itemData;

  @override
  Widget build(context) {
    final isCorrectAnswer=itemData['correctans']==itemData['chosenans'];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(isCorrectAnswer, 
        itemData['question-index'] as int),
        const SizedBox(width: 20),
        Expanded(child : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              itemData['question'] as String,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
               ),
            ),
            const SizedBox(height: 5,),
            Text(itemData['chosenans'] as String,
            style: const TextStyle(
              color: Color.fromARGB(255, 91, 250, 83)
            ),
            ),
            Text(itemData['correctans'] as String,
            style: const TextStyle(
              color: Color.fromARGB(255, 247, 51, 214)
            ),
            )

          ],

        ),
        )
      ],
    );
  }
}