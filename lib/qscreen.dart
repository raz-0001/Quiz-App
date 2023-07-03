import 'package:flutter/material.dart';
import 'package:project/answer_button.dart';
import 'package:project/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';


class Qscreen extends StatefulWidget {
  const Qscreen(this.onSelectAnswer,{super.key});

  final void Function(String ans) onSelectAnswer;

  @override
  State<Qscreen> createState() {
    return _QscreenState();
  }
}

class _QscreenState extends State<Qscreen> {

  var currInd=0;
  void answered(String ans){
    widget.onSelectAnswer(ans);
    setState(() {
      currInd++;
    });
  }
 

  @override
  Widget build(context) {
    final currentQ = questions[currInd];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             Text(
              currentQ.text,
              style:GoogleFonts.lato(
                color: const Color.fromARGB(187, 60, 86, 254),
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQ.getShuffled().map((item){
              return Answer(item, (){
                answered(item);
              });
            })
          ],
        ),
      ),
    );
  }
}
