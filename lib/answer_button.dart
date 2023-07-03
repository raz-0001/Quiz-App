import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer(this.answerText, this.onTap, {super.key});

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
            backgroundColor: const Color.fromARGB(66, 31, 31, 255),
            foregroundColor: const Color.fromARGB(255, 255, 255, 255),
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
            ),
        child: Text(answerText,textAlign: TextAlign.center,));
  }
}
